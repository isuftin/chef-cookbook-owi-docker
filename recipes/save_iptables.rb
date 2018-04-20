#
# Cookbook Name:: owi_docker
# Recipe:: save_iptables
# Description:: Saves the iptables rules for later restore

save_location = File.join(Chef::Config[:file_cache_path], 'docker_iptables_rules')

execute 'save_iptables_rules' do
  command "iptables-save -c > #{save_location}"
end
