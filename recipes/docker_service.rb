#
# Cookbook Name:: owi_docker
# Recipe:: docker_service

include_recipe 'chef-yum-docker'

node['owi_docker']['service'].each do |service_name, service_properties|
  docker_service service_name do
    env_vars service_properties['env_vars'] if ! service_properties['env_vars'].nil?
    auto_restart service_properties['auto_restart'] if ! service_properties['auto_restart'].nil?
    install_method service_properties['install_method'] if ! service_properties['install_method'].nil?
    repo service_properties['repo'] if ! service_properties['repo'].nil?
    script_url service_properties['script_url'] if ! service_properties['script_url'].nil?
    service_manager service_properties['service_manager'] if ! service_properties['service_manager'].nil?
    source service_properties['source'] if ! service_properties['source'].nil?
    package_version service_properties['package_version'] if ! service_properties['package_version'].nil?
    package_options service_properties['package_options'] if ! service_properties['package_options'].nil?
    version service_properties['version'] if ! service_properties['version'].nil?
    checksum service_properties['checksum'] if ! service_properties['checksum'].nil?
    docker_bin service_properties['docker_bin'] if ! service_properties['docker_bin'].nil?
    api_cors_header service_properties['api_cors_header'] if ! service_properties['api_cors_header'].nil?
    bridge service_properties['bridge'] if ! service_properties['bridge'].nil?
    bip service_properties['bip'] if ! service_properties['bip'].nil?
    debug service_properties['debug'] if ! service_properties['debug'].nil?
    cluster_store service_properties['cluster_store'] if ! service_properties['cluster_store'].nil?
    cluster_advertise service_properties['cluster_advertise'] if ! service_properties['cluster_advertise'].nil?
    cluster_store_opts service_properties['cluster_store_opts'] if ! service_properties['cluster_store_opts'].nil?
    daemon service_properties['daemon'] if ! service_properties['daemon'].nil?
    dns service_properties['dns'] if ! service_properties['dns'].nil?
    dns_search service_properties['dns_search'] if ! service_properties['dns_search'].nil?
    exec_driver service_properties['exec_driver'] if ! service_properties['exec_driver'].nil?
    exec_opts service_properties['exec_opts'] if ! service_properties['exec_opts'].nil?
    fixed_cidr service_properties['fixed_cidr'] if ! service_properties['fixed_cidr'].nil?
    fixed_cidr_v6 service_properties['fixed_cidr_v6'] if ! service_properties['fixed_cidr_v6'].nil?
    group service_properties['group'] if ! service_properties['group'].nil?
    graph service_properties['graph'] if ! service_properties['graph'].nil?
    host service_properties['host'] if ! service_properties['host'].nil?
    icc service_properties['icc'] if ! service_properties['icc'].nil?
    insecure_registry service_properties['insecure_registry'] if ! service_properties['insecure_registry'].nil?
    ip service_properties['ip'] if ! service_properties['ip'].nil?
    ip_forward service_properties['ip_forward'] if ! service_properties['ip_forward'].nil?
    ipv4_forward service_properties['ipv4_forward'] if ! service_properties['ipv4_forward'].nil?
    ipv6_forward service_properties['ipv6_forward'] if ! service_properties['ipv6_forward'].nil?
    ip_masq service_properties['ip_masq'] if ! service_properties['ip_masq'].nil?
    iptables service_properties['iptables'] if ! service_properties['iptables'].nil?
    ipv6 service_properties['ipv6'] if ! service_properties['ipv6'].nil?
    log_level service_properties['log_level'] if ! service_properties['log_level'].nil?
    labels service_properties['labels'] if ! service_properties['labels'].nil?
    log_driver service_properties['log_driver'] if ! service_properties['log_driver'].nil?
    log_opts service_properties['log_opts'] if ! service_properties['log_opts'].nil?
    mtu service_properties['mtu'] if ! service_properties['mtu'].nil?
    package_name service_properties['package_name'] if ! service_properties['package_name'].nil?
    pidfile service_properties['pidfile'] if ! service_properties['pidfile'].nil?
    registry_mirror service_properties['registry_mirror'] if ! service_properties['registry_mirror'].nil?
    storage_driver service_properties['storage_driver'] if ! service_properties['storage_driver'].nil?
    selinux_enabled service_properties['selinux_enabled'] if ! service_properties['selinux_enabled'].nil?
    storage_opts service_properties['storage_opts'] if ! service_properties['storage_opts'].nil?
    tls service_properties['tls'] if ! service_properties['tls'].nil?
    tls_verify service_properties['tls_verify'] if ! service_properties['tls_verify'].nil?
    tls_ca_cert service_properties['tls_ca_cert'] if ! service_properties['tls_ca_cert'].nil?
    tls_server_cert service_properties['tls_server_cert'] if ! service_properties['tls_server_cert'].nil?
    tls_server_key service_properties['tls_server_key'] if ! service_properties['tls_server_key'].nil?
    tls_client_cert service_properties['tls_client_cert'] if ! service_properties['tls_client_cert'].nil?
    tls_client_key service_properties['tls_client_key'] if ! service_properties['tls_client_key'].nil?
    default_ulimit service_properties['default_ulimit'] if ! service_properties['default_ulimit'].nil?
    http_proxy service_properties['http_proxy'] if ! service_properties['http_proxy'].nil?
    https_proxy service_properties['https_proxy'] if ! service_properties['https_proxy'].nil?
    no_proxy service_properties['no_proxy'] if ! service_properties['no_proxy'].nil?
    tmpdir service_properties['tmpdir'] if ! service_properties['tmpdir'].nil?
    logfile service_properties['logfile'] if ! service_properties['logfile'].nil?
    userland_proxy service_properties['userland_proxy'] if ! service_properties['userland_proxy'].nil?
    disable_legacy_registry service_properties['disable_legacy_registry'] if ! service_properties['disable_legacy_registry'].nil?
    userns_remap service_properties['userns_remap'] if ! service_properties['userns_remap'].nil?
    mount_flags service_properties['mount_flags'] if ! service_properties['mount_flags'].nil?
    misc_opts service_properties['misc_opts'] if ! service_properties['misc_opts'].nil?
    systemd_opts service_properties['systemd_opts'] if ! service_properties['systemd_opts'].nil?
    service_timeout service_properties['service_timeout'] if ! service_properties['service_timeout'].nil?
    action %i[create start]
  end
end
