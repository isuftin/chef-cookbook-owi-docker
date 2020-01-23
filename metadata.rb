name 'owi_docker'

maintainer 'Ivan Suftin'

maintainer_email 'isuftin@gmail.com'

license 'CPL-1.0'

description 'Installs/Configures a Docker service and Docker services'

long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

issues_url 'https://github.com/USGS-CIDA/chef-cookbook-owi-docker/issues'
source_url 'https://github.com/USGS-CIDA/chef-cookbook-owi-docker'

version '0.1.1'

chef_version '>= 14.0' if respond_to?(:chef_version)

supports 'centos', '>= 7.0'

depends 'docker'
depends 'iptables'
depends 'aws'
depends 'filesystem'
