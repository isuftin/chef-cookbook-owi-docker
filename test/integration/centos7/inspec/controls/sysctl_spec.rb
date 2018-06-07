sysctl_params = {
  "net.bridge.bridge-nf-call-ip6tables"=> "1",
  "net.bridge.bridge-nf-call-iptables"=> "1",
  "net.ipv4.conf.all.forwarding"=> "1",
  "net.ipv4.ip_forward"=> "1",
  "net.ipv4.tcp_tw_reuse"=> "1",
  "net.ipv4.tcp_fin_timeout"=> "15",
  "net.core.somaxconn"=> "4096",
  "net.core.netdev_max_backlog"=> "4096",
  "net.core.rmem_max"=> "16777216",
  "net.core.wmem_max"=> "16777216",
  "net.ipv4.tcp_max_syn_backlog"=> "20480",
  "net.ipv4.tcp_max_tw_buckets"=> "400000",
  "net.ipv4.tcp_no_metrics_save"=> "1",
  "net.ipv4.tcp_syn_retries"=> "2",
  "net.ipv4.tcp_synack_retries"=> "2",
  "vm.min_free_kbytes"=> "65536",
  "net.netfilter.nf_conntrack_max"=> "262144",
  "net.netfilter.nf_conntrack_tcp_timeout_established"=> "86400",
  "net.ipv4.neigh.default.gc_thresh1"=> "8096",
  "net.ipv4.neigh.default.gc_thresh2"=> "12288",
  "net.ipv4.neigh.default.gc_thresh3"=> "16384"
}

sysctl_params.each do |param, value|
  describe command("sysctl -n #{param}") do
    its(:stdout) { should match value }
  end
end
