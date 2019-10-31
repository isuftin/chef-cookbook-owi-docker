# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: sysctl
# Description: Updates sysctl policies using the third-party sysctl cookbook
# and parameters specific to that cookbook coming from the default attributes.

node['sysctl']['params'].each do |param, value|
  sysctl param do
    key param
    value value
    ignore_errors true
  end
end
