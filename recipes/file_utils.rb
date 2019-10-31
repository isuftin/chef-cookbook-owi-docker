# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: filesystem

# Create directories
begin
  node['owi_docker']['filesystem']['dirs'].each do |path_object|
    directory path_object['path'] do
      owner path_object['owner'] || 'root'
      group path_object['group'] || 'root'
      mode path_object['mode'] || '0755'
      action :create
      recursive true
    end
  end
rescue NoMethodError
  Chef::Log.info 'No dirs to be created'
end

# Create mounts
begin
  node['owi_docker']['filesystem']['mounts'].each do |mount_object|
    filesystem mount_object['name'] do
      fstype mount_object['fstype'] unless mount_object['fstype'].nil?
      device mount_object['device'] unless mount_object['device'].nil?
      uuid mount_object['uuid'] unless mount_object['uuid'].nil?
      file mount_object['file'] unless mount_object['file'].nil?
      vg mount_object['vg'] unless mount_object['vg'].nil?
      mkfs_options mount_object['mkfs_options'] unless mount_object['mkfs_options'].nil?
      size mount_object['size'] unless mount_object['size'].nil?
      sparse mount_object['sparse'] unless mount_object['sparse'].nil?
      stripes mount_object['stripes'] unless mount_object['stripes'].nil?
      mirrors mount_object['mirrors'] unless mount_object['mirrors'].nil?
      mount mount_object['mount'] unless mount_object['mount'].nil?
      options mount_object['options'] unless mount_object['options'].nil?
      dump mount_object['dump'] unless mount_object['dump'].nil?
      pass mount_object['pass'] unless mount_object['pass'].nil?
      user mount_object['user'] unless mount_object['user'].nil?
      group mount_object['group'] unless mount_object['group'].nil?
      mode mount_object['mode'] unless mount_object['mode'].nil?
      package mount_object['package'] unless mount_object['package'].nil?
      force mount_object['force'] unless mount_object['force'].nil?
      ignore_existing mount_object['ignore_existing'] unless mount_object['ignore_existing'].nil?
      nomkfs mount_object['nomkfs'] unless mount_object['nomkfs'].nil?
      nomount mount_object['nomount'] unless mount_object['nomount'].nil?
      noenable mount_object['noenable'] unless mount_object['noenable'].nil?
      action %i[create enable mount]
    end
  end
rescue NoMethodError
  Chef::Log.info 'No mounts to be created'
end

# Pull files from S3
begin
  node['owi_docker']['filesystem']['s3'].each do |s3|
    bucket = s3['bucket']
    paths = s3['paths']

    paths.each do |path_set|
      aws_s3_file path_set['local'] do
        bucket bucket
        remote_path path_set['remote']
        sensitive path_set['sensitive'] || true
      end
    end
  end
rescue NoMethodError
  Chef::Log.info 'No s3 files to be pulled'
end

# Pull remote files
begin
  node['owi_docker']['filesystem']['remote_files'].each do |remote_file_object|
    remote_file remote_file_object['path'] do
      source remote_file_object['source']
      owner remote_file_object['owner'] || 'root'
      group remote_file_object['group'] || 'root'
      mode remote_file_object['mode'] || '0755'
      ignore_failure remote_file_object['ignore_failure'] || false
      sensitive remote_file_object['sensitive'] || true
      retries remote_file_object['retries'] || 0
      retry_delay remote_file_object['retry_delay'] || 2
      action :create
    end
  end
rescue NoMethodError
  Chef::Log.info 'No remote files tp pull'
end
