# See https://github.com/chef-cookbooks/docker#properties-4

# The properties here are analagous to the service properties for the
# docker_service properties in the Docker cookbook
default['owi_docker']['service']['default']['install_method'] = 'package'
default['owi_docker']['service']['default']['version'] = '17.06.2'

# Users in this array will be added to the Docker group so they can use the Docker
# engine without requiring root access
default['owi_docker']['group']['users'] = ['vagrant']

# Specify the version of Docker Machine required. Otherwise, use the
# `default['owi_docker']['machine'][binary_location]` to specify your own binary
# location
default['owi_docker']['machine']['version'] = '0.12.2'

# Specify the version of Docker Compose required. Otherwise, use the
# `default['owi_docker']['compose'][binary_location]` to specify your own binary
# location
default['owi_docker']['compose']['version'] = '1.16.0'
