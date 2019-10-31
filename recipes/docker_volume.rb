# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: docker_volume
# Description:: Wraps the Docker cookbook's docker_volume resource

return unless node['owi_docker'].attribute?('volume')

node['owi_docker']['volume'].each do |volume_name, volume_properties|
  docker_volume volume_name do
    driver volume_properties['driver'] unless volume_properties['driver'].nil?
    host volume_properties['host'] unless volume_properties['host'].nil?
    opts volume_properties['opts'] unless volume_properties['opts'].nil?
    volume volume_properties['volume'] unless volume_properties['volume'].nil?
    action volume_properties.key?('action') ? volume_properties['action'].map(&:to_sym) : %i[create]
  end
end
