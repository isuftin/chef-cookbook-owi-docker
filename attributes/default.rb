# See https://github.com/chef-cookbooks/docker#properties-4

# The properties here are analagous to the service properties for the
# docker_service properties in the Docker cookbook
# See the following:
# https://github.com/chef-cookbooks/docker/blob/master/libraries/docker_service.rb
# and
# https://github.com/chef-cookbooks/docker/blob/master/libraries/docker_service_base.rb
default['owi_docker']['service']['default']['install_method'] = 'package'
default['owi_docker']['service']['default']['version'] = '18.06.1'

# Users in this array will be added to the Docker group so they can use the Docker
# engine without requiring root access
default['owi_docker']['group']['users'] = ['vagrant']

# Specify the version of Docker Machine required. Otherwise, use the
# `default['owi_docker']['machine'][binary_location]` to specify your own binary
# location
default['owi_docker']['machine']['version'] = '0.16.0'

# Specify the version of Docker Compose required. Otherwise, use the
# `default['owi_docker']['compose'][binary_location]` to specify your own binary
# location
default['owi_docker']['compose']['version'] = '1.23.0'

default['owi_docker']['service'] = {}
default['owi_docker']['container'] = {}

# When restoring iptables, should the tables be flushed before restoring
default['owi_docker']['iptables']['restore']['flush'] = false

# Create a directory structure
# Example:
# default['owi_docker']['filesystem']['dirs'] = [
#   { 'path' => '/root/container/data/' },
#   {
#     'path' => '/root/container/container_name/data/',
#     'owner' => 'ec2-user',
#     'group' => 'ec2-user',
#     'mode' => '0644',
#   }
# ]
default['owi_docker']['filesystem']['dirs'] = []

# Pull down remote files from S3 using the
# Example:
#   default['owi_docker']['filesystem']['s3'] = [
#       {
#         'bucket': 'test_bucket',
#         'paths': [
#           {
#             'remote': 'some/remote/file/1.txt',
#             'local': '/tmp/data/1.txt'
#           },
#           {
#             'remote': 'some/other/remote/file/2.txt',
#             'local': '/tmp/data/2.txt'
#           }
#         ]
#       }
#     ]
default['owi_docker']['filesystem']['s3'] = []

# Pull down remote files using the remote_file Chef resource
# Example:
# default['owi_docker']['filesystem']['remote_files'] = [
#   {
#     'source': 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
#     'path': '/tmp/dummy.pdf'
#   }
# ]
default['owi_docker']['filesystem']['remote_files'] = []
