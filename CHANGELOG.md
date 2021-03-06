# CHANGELOG

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.1.1] - 2020-01-23
### Added
- isuftin@usgs.gov - Ability to set file owner and permissions on S3 downloads

## [0.1.0] - 2019-10-31
### Added
- isuftin@usgs.gov - dependency on filesystem cookbook, adds lvm cookbook depdency
- isuftin@usgs.gov - included the ability to mount filesystems within the file_utils
  recipe

### Changed
- isuftin@usgs.gov - using Chef sysctl resource instead of third party cookbook
- isuftin@usgs.gov - now requires Chef >= 14.0
- isuftin@usgs.gov - beautifying
- isuftin@usgs.gov - updated docker, docker-compose and docker-machine versions in
  default attributes


### Removed
- isuftin@usgs.gov - depency on sysctl cookbook

## [0.0.16] - 2019-02-20
### Added
- isuftin@usgs.gov - systemd_socket_opts option to docker_service recipe to match with
  latest upstream docker cookbook
- isuftin@usgs.gov - shm_size option to docker_container recipe to match with
  latest upstream docker cookbook

## [0.0.15] - 2018-11-20
### Added
- isuftin@usgs.gov - file_utils recipe allowing creation of directories and pulling
of files from remote resources as well as S3 buckets
- isuftin@usgs.gov - Inspec testing to work with file_utils recipe
- isuftin@usgs.gov - AWS cookbook dependency https://supermarket.chef.io/cookbooks/aws

### Updated
- isuftin@usgs.gov - Updated the version of Docker to install
- isuftin@usgs.gov - Updated the version of Docker Compose to install
- isuftin@usgs.gov - Updated the version of Docker Machine to install

## [0.0.14] - 2018-10-24
- isuftin@usgs.gov - Added the `setup_docker_repo` property to the docker_service recipe
- isuftin@usgs.gov - Added the `default_ip_address_pool` property to the docker_service recipe

## [0.0.13] - 2018-06-07
### Updated
- isuftin@usgs.gov - Cleaned up the logic to define actions going into each resource
- isuftin@usgs.gov - Added new recipes to the README

### Removed
- isuftin@usgs.gov - sysctl version constraint

### Added
- isuftin@usgs.gov - Serverspec testing for docker_network recipe
- isuftin@usgs.gov - Serverspec testing for docker_volume recipe
- isuftin@usgs.gov - wrapper recipe for Docker cookbook docker_network resource
- isuftin@usgs.gov - wrapper recipe for Docker cookbook docker_volume resource
- isuftin@usgs.gov - sysctl serverspec testing
- isuftin@usgs.gov - sysctl cookbook dependency to metadata and Berksfile
- isuftin@usgs.gov - sysctl recipe to work against sysctl cookbook's sysctl_param
resource

## [0.0.12] - 2018-05-04
### Updated
- isuftin@usgs.gov - Fix an issue with the upstream iptables cookbook not adding
a DOCKER chain if there is no Docker rule set in the current iptables. The fix
is hacky and perilous

## [0.0.11] - 2018-04-25
### Updated
- isuftin@usgs.gov - iptables recipe now works with the  upstream iptables cookbook
to retain Docker rules that the Docker engine sets. Previously, any other cookbook
laying down iptables rules via the iptables cookbook would clobber any Docker rules
because the Docker rules are set manually and not by the iptables cookbook

## [0.0.10] - 2018-04-20
### Updated
- isuftin@usgs.gov - Include latest upstream Docker cookbook flags for container recipe
- isuftin@usgs.gov - Default versions for Docker engine and Docker Compose
### Added
- isuftin@usgs.gov - Recipes to save iptables to file and restore. Restore includes
a delayed recipe to delay until the end of the Chef run

## [0.0.9] - 2018-03-16
### Updated
- isuftin@usgs.gov - Default versions for Docker engine and Docker Machine
- isuftin@usgs.gov - Ensure that not including the `[owi_docker][container]` or
`[owi_docker][image]` attributes does not result in an error
### Added
- isuftin@usgs.gov - Docker container now redeploys when a new hash is pulled down (e.g. latest)


## [0.0.8] - 2018-02-20
### Added
- isuftin@usgs.gov - Port mapping to docker container recipe

## [0.0.7] - 2018-02-20
### Added
- isuftin@usgs.gov - Docker Image wrapper recipe
- isuftin@usgs.gov - Docker Container wrapper recipe
### Updated
- isuftin@usgs.gov - Kitchen configuration and styling

## [0.0.6] - 2018-01-02
### Added
- isuftin@usgs.gov - Added iptables recipe to allow implementors to update IPTables to allow Docker communication

## [0.0.5] - 2017-09-27
### Added
- isuftin@usgs.gov - Updated attributes checking to see if they exist in the incoming attributes. Some attributes were not being passed through.

## [0.0.4] - 2017-09-27
### Added
- isuftin@usgs.gov - Added attributes into the Docker cookbook that match the upstream Docker cookbook

## [0.0.3] - 2017-07-07
### Added
- isuftin@usgs.gov - Fixed a very glaring bug in docker service creation
- isuftin@usgs.gov - Update Test Kitchen for CentOS 7 to use overlay2 driver by default

## [0.0.2] - 2017-06-07
### Added
- isuftin@usgs.gov - Created a users_to_docker_group recipe.
- isuftin@usgs.gov - Added ChefSpec testing for the users_to_docker_group recipe

## [0.0.1] - 2017-06-06
### Added
- isuftin@usgs.gov - Initial version.
