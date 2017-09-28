# CHANGELOG

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

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
