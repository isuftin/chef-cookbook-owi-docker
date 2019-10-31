# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: docker_machine

machine_config = node['owi_docker']['machine']
version = machine_config['version']

local_binary = File.join('/usr/local/bin/docker-machine')
github_downloads = 'https://github.com/docker/machine/releases/download'
remote = machine_config['binary_location'] || "#{github_downloads}/v#{version}/docker-machine-Linux-x86_64"

remote_file local_binary do
  source remote
  owner 'root'
  group 'root'
  mode '0755'
end
