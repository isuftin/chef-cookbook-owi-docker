#
# Cookbook Name:: owi_docker
# Recipe:: docker_container

node['owi_docker']['container'].each do |container_name, container_properties|
  actions = %i[run]

  if container_properties.key?('actions')
    actions = [container_properties['actions'].map(&:to_sym)]
  end

  docker_container container_name do
    attach_stderr container_properties['attach_stderr'] unless container_properties['attach_stderr'].nil?
    attach_stdin container_properties['attach_stdin'] unless container_properties['attach_stdin'].nil?
    attach_stdout container_properties['attach_stdout'] unless container_properties['attach_stdout'].nil?
    autoremove container_properties['autoremove'] unless container_properties['autoremove'].nil?
    cap_add container_properties['cap_add'] unless container_properties['cap_add'].nil?
    cap_drop container_properties['cap_drop'] unless container_properties['cap_drop'].nil?
    cgroup_parent container_properties['cgroup_parent'] unless container_properties['cgroup_parent'].nil?
    command container_properties['command'] unless container_properties['command'].nil?
    container container_properties['container'] unless container_properties['container'].nil?
    cpu_shares container_properties['cpu_shares'] unless container_properties['cpu_shares'].nil?
    cpuset_cpus container_properties['cpuset_cpus'] unless container_properties['cpuset_cpus'].nil?
    detach container_properties['detach'] unless container_properties['detach'].nil?
    devices container_properties['devices'] unless container_properties['devices'].nil?
    dns container_properties['dns'] unless container_properties['dns'].nil?
    dns_search container_properties['dns_search'] unless container_properties['dns_search'].nil?
    domain_name container_properties['domain_name'] unless container_properties['domain_name'].nil?
    entrypoint container_properties['entrypoint'] unless container_properties['entrypoint'].nil?
    env container_properties['env'] unless container_properties['env'].nil?
    env_file container_properties['env_file'] unless container_properties['env_file'].nil?
    extra_hosts container_properties['extra_hosts'] unless container_properties['extra_hosts'].nil?
    exposed_ports container_properties['exposed_ports'] unless container_properties['exposed_ports'].nil?
    force container_properties['force'] unless container_properties['force'].nil?
    host container_properties['host'] unless container_properties['host'].nil?
    hostname container_properties['hostname'] unless container_properties['hostname'].nil?
    init container_properties['init'] unless container_properties['init'].nil?
    ip_address container_properties['ip_address'] unless container_properties['ip_address'].nil?
    ipc_mode container_properties['ipc_mode'] unless container_properties['ipc_mode'].nil?
    kernel_memory container_properties['kernel_memory'] unless container_properties['kernel_memory'].nil?
    kill_after container_properties['kill_after'] unless container_properties['kill_after'].nil?
    labels container_properties['labels'] unless container_properties['labels'].nil?
    links container_properties['links'] unless container_properties['links'].nil?
    log_driver container_properties['log_driver'] unless container_properties['log_driver'].nil?
    log_opts container_properties['log_opts'] unless container_properties['log_opts'].nil?
    mac_address container_properties['mac_address'] unless container_properties['mac_address'].nil?
    memory container_properties['memory'] unless container_properties['memory'].nil?
    memory_swap container_properties['memory_swap'] unless container_properties['memory_swap'].nil?
    memory_swappiness container_properties['memory_swappiness'] unless container_properties['memory_swappiness'].nil?
    memory_reservation container_properties['memory_reservation'] unless container_properties['memory_reservation'].nil?
    network_disabled container_properties['network_disabled'] unless container_properties['network_disabled'].nil?
    network_mode container_properties['network_mode'] unless container_properties['network_mode'].nil?
    network_aliases container_properties['network_aliases'] unless container_properties['network_aliases'].nil?
    open_stdin container_properties['open_stdin'] unless container_properties['open_stdin'].nil?
    outfile container_properties['outfile'] unless container_properties['outfile'].nil?
    port container_properties['port'] unless container_properties['port'].nil?
    port_bindings container_properties['port_bindings'] unless container_properties['port_bindings'].nil?
    pid_mode container_properties['pid_mode'] unless container_properties['pid_mode'].nil?
    privileged container_properties['privileged'] unless container_properties['privileged'].nil?
    publish_all_ports container_properties['publish_all_ports'] unless container_properties['publish_all_ports'].nil?
    remove_volumes container_properties['remove_volumes'] unless container_properties['remove_volumes'].nil?
    repo container_properties['repo'] unless container_properties['repo'].nil?
    restart_maximum_retry_count container_properties['restart_maximum_retry_count'] unless container_properties['restart_maximum_retry_count'].nil?
    restart_policy container_properties['restart_policy'] unless container_properties['restart_policy'].nil?
    ro_rootfs container_properties['ro_rootfs'] unless container_properties['ro_rootfs'].nil?
    runtime container_properties['runtime'] unless container_properties['runtime'].nil?
    security_opt container_properties['security_opt'] unless container_properties['security_opt'].nil?
    signal container_properties['signal'] unless container_properties['signal'].nil?
    stdin_once container_properties['stdin_once'] unless container_properties['stdin_once'].nil?
    sysctls container_properties['sysctls'] unless container_properties['sysctls'].nil?
    tag container_properties['tag'] unless container_properties['tag'].nil?
    timeout container_properties['timeout'] unless container_properties['timeout'].nil?
    tty container_properties['tty'] unless container_properties['tty'].nil?
    ulimits container_properties['ulimits'] unless container_properties['ulimits'].nil?
    user container_properties['user'] unless container_properties['user'].nil?
    userns_mode container_properties['userns_mode'] unless container_properties['userns_mode'].nil?
    uts_mode container_properties['uts_mode'] unless container_properties['uts_mode'].nil?
    volume_driver container_properties['volume_driver'] unless container_properties['volume_driver'].nil?
    volumes container_properties['volumes'] unless container_properties['volumes'].nil?
    volumes_binds container_properties['volumes_binds'] unless container_properties['volumes_binds'].nil?
    volumes_from container_properties['volumes_from'] unless container_properties['volumes_from'].nil?
    working_dir container_properties['working_dir'] unless container_properties['working_dir'].nil?

    action actions
  end
end
