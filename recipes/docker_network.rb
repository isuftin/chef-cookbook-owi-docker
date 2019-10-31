# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: docker_network
# Description:: Wraps the Docker cookbook's docker_network resource

return unless node['owi_docker'].attribute?('network')

node['owi_docker']['network'].each do |network_name, network_properties|
  docker_network network_name do
    aux_address network_properties['aux_address'] unless network_properties['aux_address'].nil?
    container network_properties['container'] unless network_properties['container'].nil?
    driver network_properties['driver'] unless network_properties['driver'].nil?
    driver_opts network_properties['driver_opts'] unless network_properties['driver_opts'].nil?
    enable_ipv6 network_properties['enable_ipv6'] unless network_properties['enable_ipv6'].nil?
    gateway network_properties['gateway'] unless network_properties['gateway'].nil?
    host network_properties['host'] unless network_properties['host'].nil?
    id network_properties['id'] unless network_properties['id'].nil?
    internal network_properties['internal'] unless network_properties['internal'].nil?
    ip_range network_properties['ip_range'] unless network_properties['ip_range'].nil?
    ipam_driver network_properties['ipam_driver'] unless network_properties['ipam_driver'].nil?
    network network_properties['network'] unless network_properties['network'].nil?
    subnet network_properties['subnet'] unless network_properties['subnet'].nil?

    action network_properties.key?('action') ? network_properties['action'].map(&:to_sym) : %i[create]
  end
end
