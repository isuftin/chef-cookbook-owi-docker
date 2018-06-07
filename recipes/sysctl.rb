#
# Cookbook Name:: owi_docker
# Recipe:: sysctl
# Description: Updates sysctl policies using the third-party sysctl cookbook
# and parameters specific to that cookbook coming from the default attributes.

node['sysctl']['params'].each do |param, value|
  sysctl_param param do
    key param
    value value
    only_if "sysctl -n #{param}"
  end
end
