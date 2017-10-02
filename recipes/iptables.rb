#
# Cookbook Name:: owi_docker
# Recipe:: iptables
# Description:: Sets up IPTables rules

node['owi_docker']['iptables']['rules'].map do |rule_name, rule_body|
  iptables_rule rule_name do
    lines [rule_body].flatten.join("\n")
  end
end
