# frozen_string_literal: true

#
# Cookbook Name:: owi_docker
# Recipe:: docker_service

node['owi_docker']['service'].each do |service_name, service_properties|
  docker_service service_name do
    api_cors_header service_properties['api_cors_header'] unless service_properties['api_cors_header'].nil?
    auto_restart service_properties['auto_restart'] unless service_properties['auto_restart'].nil?
    bridge service_properties['bridge'] unless service_properties['bridge'].nil?
    bip service_properties['bip'] unless service_properties['bip'].nil?
    checksum service_properties['checksum'] unless service_properties['checksum'].nil?
    cluster_store service_properties['cluster_store'] unless service_properties['cluster_store'].nil?
    cluster_advertise service_properties['cluster_advertise'] unless service_properties['cluster_advertise'].nil?
    cluster_store_opts service_properties['cluster_store_opts'] unless service_properties['cluster_store_opts'].nil?
    daemon service_properties['daemon'] unless service_properties['daemon'].nil?
    data_root service_properties['data_root'] unless service_properties['data_root'].nil?
    debug service_properties['debug'] unless service_properties['debug'].nil?
    default_ip_address_pool service_properties['default_ip_address_pool'] unless service_properties['default_ip_address_pool'].nil?
    default_ulimit service_properties['default_ulimit'] unless service_properties['default_ulimit'].nil?
    disable_legacy_registry service_properties['disable_legacy_registry'] unless service_properties['disable_legacy_registry'].nil?
    dns service_properties['dns'] unless service_properties['dns'].nil?
    dns_search service_properties['dns_search'] unless service_properties['dns_search'].nil?
    docker_bin service_properties['docker_bin'] unless service_properties['docker_bin'].nil?
    env_vars service_properties['env_vars'] unless service_properties['env_vars'].nil?
    exec_driver service_properties['exec_driver'] unless service_properties['exec_driver'].nil?
    exec_opts service_properties['exec_opts'] unless service_properties['exec_opts'].nil?
    fixed_cidr service_properties['fixed_cidr'] unless service_properties['fixed_cidr'].nil?
    fixed_cidr_v6 service_properties['fixed_cidr_v6'] unless service_properties['fixed_cidr_v6'].nil?
    group service_properties['group'] unless service_properties['group'].nil?
    graph service_properties['graph'] unless service_properties['graph'].nil?
    host service_properties['host'] unless service_properties['host'].nil?
    http_proxy service_properties['http_proxy'] unless service_properties['http_proxy'].nil?
    https_proxy service_properties['https_proxy'] unless service_properties['https_proxy'].nil?
    icc service_properties['icc'] unless service_properties['icc'].nil?
    insecure_registry service_properties['insecure_registry'] unless service_properties['insecure_registry'].nil?
    install_method service_properties['install_method'] unless service_properties['install_method'].nil?
    ip service_properties['ip'] unless service_properties['ip'].nil?
    ip_forward service_properties['ip_forward'] unless service_properties['ip_forward'].nil?
    ip_masq service_properties['ip_masq'] unless service_properties['ip_masq'].nil?
    iptables service_properties['iptables'] unless service_properties['iptables'].nil?
    ipv4_forward service_properties['ipv4_forward'] unless service_properties['ipv4_forward'].nil?
    ipv6_forward service_properties['ipv6_forward'] unless service_properties['ipv6_forward'].nil?
    ipv6 service_properties['ipv6'] unless service_properties['ipv6'].nil?
    labels service_properties['labels'] unless service_properties['labels'].nil?
    log_driver service_properties['log_driver'] unless service_properties['log_driver'].nil?
    log_level service_properties['log_level'] unless service_properties['log_level'].nil?
    log_opts service_properties['log_opts'] unless service_properties['log_opts'].nil?
    logfile service_properties['logfile'] unless service_properties['logfile'].nil?
    misc_opts service_properties['misc_opts'] unless service_properties['misc_opts'].nil?
    mount_flags service_properties['mount_flags'] unless service_properties['mount_flags'].nil?
    mtu service_properties['mtu'] unless service_properties['mtu'].nil?
    no_proxy service_properties['no_proxy'] unless service_properties['no_proxy'].nil?
    package_name service_properties['package_name'] unless service_properties['package_name'].nil?
    package_options service_properties['package_options'] unless service_properties['package_options'].nil?
    package_version service_properties['package_version'] unless service_properties['package_version'].nil?
    pidfile service_properties['pidfile'] unless service_properties['pidfile'].nil?
    registry_mirror service_properties['registry_mirror'] unless service_properties['registry_mirror'].nil?
    repo service_properties['repo'] unless service_properties['repo'].nil?
    script_url service_properties['script_url'] unless service_properties['script_url'].nil?
    selinux_enabled service_properties['selinux_enabled'] unless service_properties['selinux_enabled'].nil?
    service_manager service_properties['service_manager'] unless service_properties['service_manager'].nil?
    service_timeout service_properties['service_timeout'] unless service_properties['service_timeout'].nil?
    setup_docker_repo service_properties['setup_docker_repo'] unless service_properties['setup_docker_repo'].nil?
    source service_properties['source'] unless service_properties['source'].nil?
    storage_driver service_properties['storage_driver'] unless service_properties['storage_driver'].nil?
    storage_opts service_properties['storage_opts'] unless service_properties['storage_opts'].nil?
    systemd_opts service_properties['systemd_opts'] unless service_properties['systemd_opts'].nil?
    systemd_socket_opts service_properties['systemd_socket_opts'] unless service_properties['systemd_socket_opts'].nil?
    tls_ca_cert service_properties['tls_ca_cert'] unless service_properties['tls_ca_cert'].nil?
    tls_client_cert service_properties['tls_client_cert'] unless service_properties['tls_client_cert'].nil?
    tls_client_key service_properties['tls_client_key'] unless service_properties['tls_client_key'].nil?
    tls_server_cert service_properties['tls_server_cert'] unless service_properties['tls_server_cert'].nil?
    tls_server_key service_properties['tls_server_key'] unless service_properties['tls_server_key'].nil?
    tls service_properties['tls'] unless service_properties['tls'].nil?
    tls_verify service_properties['tls_verify'] unless service_properties['tls_verify'].nil?
    tmpdir service_properties['tmpdir'] unless service_properties['tmpdir'].nil?
    userland_proxy service_properties['userland_proxy'] unless service_properties['userland_proxy'].nil?
    userns_remap service_properties['userns_remap'] unless service_properties['userns_remap'].nil?
    version service_properties['version'] unless service_properties['version'].nil?
    action service_properties.key?('action') ? service_properties['action'].map(&:to_sym) : %i[create start]
  end
end
