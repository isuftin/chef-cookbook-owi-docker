# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: users_to_docker_group
#
# Description:: Add all users specified to the Docker group to allow those users
# to use the Docker CLI without requiring sudo access

service_config = node['owi_docker']['service']

docker_group = service_config['group'] || 'docker'

# Added a guard because with the modify action, if the group does not yet exist,
# this will cause an error. If this recipe is run before docker_service, the docker
# group won't exist and this resource won't run. By the time a second run is made,
# the group should exist by that time and this should run fine
group docker_group do
  members node['owi_docker']['group']['users']
  append true
  action :modify
  only_if "grep -q #{docker_group} /etc/group"
end
