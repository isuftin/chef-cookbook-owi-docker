# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: iptables
# Description:: The iptables cookbook clobbers pre-existing iptables rules unless
# they are set through the iptables cookbook. This recipe allows preservation of the
# rules that the Docker engine manually sets during the starting of the Docker service
# and the launching (and removal) of containers. It saves the current iptables rules
# to file and digests that file through to the iptables cookbook to be laid down by it.
# This recipe should be run *after* running docker_service and docker_container recipes.

# This is where the iptables save file will be created using the "iptables-save"
# utility
save_location = File.join(Chef::Config[:file_cache_path], 'docker_iptables_rules')

# Perform the save
execute 'save_iptables_rules' do
  command "iptables-save > #{save_location}"
end

include_recipe 'iptables'

# This needs to happen inside of a ruby block so that the file manipulation
# happens after the iptables-save call during the chef run and not during
# cookbook compilation
ruby_block 'restore_iptables_rules' do # ~FC014
  block do
    table_hash = {}
    current_table = ''

    # The iptables save file needs to be digested and a hash of table -> [ rules ]
    # created from it to feed to the upstream iptables cookbook
    # The best I could find for this format is
    # https://unix.stackexchange.com/questions/400163/netfilter-iptables-restore-file-format-documentation
    File.open(save_location).readlines.each do |line|
      # We don't care about comments
      next if line.start_with?('#')
      # .. or COMMIT
      next if line.start_with?('COMMIT')
      # .. or CHAIN definitions
      next if line.start_with?(':')

      # Lines starting with '*' begin a block of rules dealing with the table
      # that is named on this line (e.g. *nat)
      # So I take everything after '*' and before a carriage return character
      # as the name of the table
      if line.start_with?('*')
        current_table = line[1..-1].tr("\n", '')
        table_hash[current_table] = []
      else
        # If the line does not contain the word "docker" on it, the rule does not
        # deal with docker and I don't care about it
        next unless line.downcase.include?('docker')

        # If it does deal with docker, I save it to the current table array
        table_hash[current_table] << line.tr("\n", '')
      end
    end

    # Now I have a hash that looks like
    # {
    #  'table_name_1' => [ 'rule1', 'rule2', 'rule3'],
    #  'table_name_2' => [ 'rulea', 'ruleb', 'rulec']
    # }
    # For each key (which, for a value is a table name), I want to create a set
    # of rules that are fed into the "lines" variable in the "iptables_rule" resource
    # The "table" variableb gets the name of the table as a Ruby symbol
    # I have to call the iptables_rule resource in a weird way because I'm in a ruby
    # block which does not necessarily have access to cookbook resources as a first
    # class citizen
    table_hash.each do |table, lines|
      # For each table, the iptables cookbook only adds a chain if it finds a line
      # with this regex \-[ADRILFZN]\s+([-a-zA-Z0-9_]+)\s
      # Docker, unless it's running a container with a port mapping
      # will not create a rule like
      # "-A DOCKER -d 172.17.0.2/32 ! -i docker0 -o docker0 -p tcp -m tcp --dport 3306 -j ACCEPT"
      # and because of this, iptables will not create a :DOCKER chain. If that does
      # not happen, the iptables-restore command fails and the chef-run errors out.
      # This check looks to see if the table rules have any lines starting with
      # "-A DOCKER " (not the space at the end) and if not, will inject the
      # chain into the rule set as a line which then forces the iptables cookbook
      # to create the chain on restore. If there is already a rule for DOCKER,
      # it will not do so
      #
      # Yes, this is hacky. This is a large TODO to FIXME
      lines.insert(1, ':DOCKER -') if lines.index { |s| s.include?('-A DOCKER ') }.nil?
      r = Chef::ResourceResolver.resolve(:iptables_rule).new("docker_table_#{table}", run_context)
      r.lines = lines.join("\n")
      r.table = table.to_sym
      r.run_action :enable
    end
  end
end
