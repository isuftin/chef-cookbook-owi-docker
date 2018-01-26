# See https://github.com/chef-cookbooks/docker#properties-4

# The properties here are analagous to the service properties for the
# docker_service properties in the Docker cookbook
# See the following:
# https://github.com/chef-cookbooks/docker/blob/master/libraries/docker_service.rb
# and
# https://github.com/chef-cookbooks/docker/blob/master/libraries/docker_service_base.rb
default['owi_docker']['service']['default']['install_method'] = 'package'
default['owi_docker']['service']['default']['version'] = '17.12.0'

# Users in this array will be added to the Docker group so they can use the Docker
# engine without requiring root access
default['owi_docker']['group']['users'] = ['vagrant']

# Specify the version of Docker Machine required. Otherwise, use the
# `default['owi_docker']['machine'][binary_location]` to specify your own binary
# location
default['owi_docker']['machine']['version'] = '0.13.0'

# Specify the version of Docker Compose required. Otherwise, use the
# `default['owi_docker']['compose'][binary_location]` to specify your own binary
# location
default['owi_docker']['compose']['version'] = '1.18.0'
