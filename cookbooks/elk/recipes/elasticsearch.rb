package "elasticsearch" do
  version node['elasticsearch']['version']
  action :install
end

service "elasticsearch" do
  action [:enable, :start]
end

template "/etc/elasticsearch/elasticsearch.yml" do
  source "elasticsearch.yml.erb"
  variables({
    es_cluster_name: node['es']['cluster']['name'],
    es_cluster_ip: node['es']['cluster']['ip'],
    min_master_nodes: node['master_nodes']['min'],
    xpack_notification_username: node['xpack']['notification']['username'],
    xpack_notification_password: node['xpack']['notification']['password'],
    xpack_notification_port: node['xpack']['notification']['port'],
    xpack_notification_host: node['xpack']['notification']['host'],
    xpack_notification_profile: node['xpack']['notification']['profile']
    })
  notifies :restart, 'service[elasticsearch]'
end

template "/etc/elasticsearch/jvm.options" do
  source "jvm.options.erb"
  notifies :restart, 'service[elasticsearch]'
end

execute "es-x-pack" do
  not_if { Dir.exist?("/usr/share/elasticsearch/plugins/x-pack")}
  ignore_failure true
  command '/usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack --batch'

  notifies :restart, 'service[elasticsearch]'
end
