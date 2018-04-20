# CHANGELOG

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.0.10] - 2017-04-20
### Updated
- isuftin@usgs.gov - Include latest upstream Docker cookbook flags for container recipe
- isuftin@usgs.gov - Default versions for Docker engine and Docker Compose
### Added
- isuftin@usgs.gov - Recipes to save iptables to file and restore. Restore includes
a delayed recipe to delay until the end of the Chef run

## [0.0.9] - 2017-03-16
### Updated
- isuftin@usgs.gov - Default versions for Docker engine and Docker Machine
- isuftin@usgs.gov - Ensure that not including the `[owi_docker][container]` or
`[owi_docker][image]` attributes does not result in an error
### Added
- isuftin@usgs.gov - Docker container now redeploys when a new hash is pulled down (e.g. latest)


## [0.0.8] - 2017-02-20
### Added
- isuftin@usgs.gov - Port mapping to docker container recipe

## [0.0.7] - 2017-02-20
### Added
- isuftin@usgs.gov - Docker Image wrapper recipe
- isuftin@usgs.gov - Docker Container wrapper recipe
### Updated
- isuftin@usgs.gov - Kitchen configuration and styling

## [0.0.6] - 2017-01-02
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
