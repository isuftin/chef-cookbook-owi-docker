# OWI Docker Cookbook

[![Build Status](https://travis-ci.org/USGS-CIDA/chef-cookbook-owi-docker.svg?branch=master)](https://travis-ci.org/USGS-CIDA/chef-cookbook-owi-docker)

## Scope

This cookbook helps with the installation of the Docker engine, Docker Machine and
Docker Compose. This cookbook has been tested on CentOS 7. CentOS 6 should work but
CentOS 6 has very outdated versions of Docker.

This cookbook may work with other Linux installations as well, but has not been
tested.

## Requirements

- Chef 12.5.x or higher
- SELinux permissive/disabled if CentOS [Docker Issue #15498](https://github.com/docker/docker/issues/15498)

## Cookbook Dependencies

- [docker](https://supermarket.chef.io/cookbooks/docker)
- [chef-yum-docker](https://supermarket.chef.io/cookbooks/chef-yum-docker)

## Usage

### Docker
---

In order to install the Docker engine, run the `owi_docker::docker_service` recipe.
The default installation version of the Docker engine that ships with this cookbook
is `17.03.1`. If you wish to install a different version, update the
`default['owi_docker']['service']['default']['version']` attribute.

Other attributes to update can be found [here](https://github.com/chef-cookbooks/docker#properties-4).
Because this cookbook is a wrapper around the community Docker cookbook, any attributes
that can be used. When wishing to use a property from the list of properties linked above,
simply add that property key to the `default['owi_docker']['service']['default']` hash
and provide the value.

Typically, Docker requires sudo access to perform commands. In order to have users
(like jenkins or rundeck) use the Docker CLI, add those users to the `default['owi_docker']['group']['users']`
array and run the `users_to_docker_group` recipe. This recipe obviously needs to be
run after the Docker service is installed via the `docker_service` recipe.

### Docker Image
---

The `owi_docker::docker_image` recipe is a wrapper around the upstream Docker cookbook
library. Use the same properties in this recipe as you would passing to the Docker
cookbook docker_image library.

### Docker Container
---

The `owi_docker::docker_container` recipe is a wrapper around the upstream Docker cookbook
library. Use the same properties in this recipe as you would passing to the Docker
cookbook docker_container library. 

### Docker Machine
---

Docker Machine can be installed. Simply specify which version you
want using the `default['owi_docker']['machine']['version']` attribute. You can also
add `default['owi_docker']['machine']['binary_location']` if you wish to install from
a binary that you host. To install, run the `owi_docker::docker_machine` recipe

### Docker Compose
---

Docker Compose is also available to be installed. Simply specify which version you
want using the `default['owi_docker']['compose']['version']` attribute. You can also
add `default['owi_docker']['compose']['binary_location']` if you wish to install from
a binary that you host. To install, run the `owi_docker::docker_compose recipe`
