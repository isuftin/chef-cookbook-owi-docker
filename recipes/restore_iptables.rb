# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: restore_iptables
# Description:: Restores the iptables rules from file

save_location = File.join(Chef::Config[:file_cache_path], 'docker_iptables_rules')
flush_flag = node['owi_docker']['iptables']['restore']['flush'] ? '' : '--noflush'

execute 'restore_iptables_rules' do
  command "iptables-restore -c #{flush_flag} < #{save_location}"
  only_if { File.exist?(save_location) }
end
