#
# Cookbook Name:: owi_docker
# Recipe:: filesystem

# Create directories
node['owi_docker']['filesystem']['dirs'].each do |path_object|
  directory path_object['path'] do
    owner path_object['owner'] || 'root'
    group path_object['group'] || 'root'
    mode path_object['mode'] || '0755'
    action :create
    recursive true
  end
end

# Pull files from S3
node['owi_docker']['filesystem']['s3'].each do |s3|
  bucket = s3['bucket']
  paths = s3['paths']

  paths.each do |path_set|
    remote_path = path_set['remote']
    local_path = path_set['local']
    sensitive =  path_set['sensitive'] || true
    aws_s3_file local_path do
      bucket bucket
      remote_path remote_path
      sensitive sensitive
    end
  end
end

# Pull remote files
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
