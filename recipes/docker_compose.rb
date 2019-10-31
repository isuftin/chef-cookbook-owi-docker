# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: docker_compose

compose_config = node['owi_docker']['compose']
version = compose_config['version']

local_binary = File.join('/usr/local/bin/docker-compose')
github_downloads = 'https://github.com/docker/compose/releases/download'
remote = compose_config['binary_location'] || "#{github_downloads}/#{version}/docker-compose-Linux-x86_64"

remote_file local_binary do
  source remote
  owner 'root'
  group 'root'
  mode '0755'
end
