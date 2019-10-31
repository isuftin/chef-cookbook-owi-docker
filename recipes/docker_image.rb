# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: docker_image

return unless node['owi_docker'].attribute?('image')

node['owi_docker']['image'].each do |image_name, image_properties|
  docker_image image_name do
    destination image_properties['destination'] unless image_properties['destination'].nil?
    force image_properties['force'] unless image_properties['force'].nil?
    host image_properties['host'] unless image_properties['host'].nil?
    image_name image_properties['image_name'] unless image_properties['image_name'].nil?
    nocache image_properties['nocache'] unless image_properties['nocache'].nil?
    noprune image_properties['noprune'] unless image_properties['noprune'].nil?
    read_timeout image_properties['read_timeout'] unless image_properties['read_timeout'].nil?
    repo image_properties['repo'] unless image_properties['repo'].nil?
    rm image_properties['rm'] unless image_properties['rm'].nil?
    source image_properties['source'] unless image_properties['source'].nil?
    tag image_properties['tag'] unless image_properties['tag'].nil?

    action image_properties.key?('action') ? image_properties['action'].map(&:to_sym) : %i[pull]
  end
end
