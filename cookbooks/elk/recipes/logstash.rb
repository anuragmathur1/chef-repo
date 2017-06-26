package "logstash" do
  action :install
end

template "/etc/logstash.logstash.yml" do
  source "logstash.yml.erb"
  variables({
    logstash_reload_automatic: node['logstash']['reload_automatic'],
    logstash_reload_interval: node['logstash']['reload_interval']
    })
    notifies :reload, 'service[logstash]'
end


template "/etc/logstash/conf.d/logstash.conf" do
  source "logstash.conf.erb"
  variables({
#    region: node["opsworks"]["instance"]["region"],
    region: 'ap-southeast-2',
    apache_access_bucket: node["logs"]["web_access"]["bucket"],
    apache_error_bucket: node["logs"]["web_error"]["bucket"],
    app_log_bucket: node["logs"]["app"]["bucket"]
    })
    notifies :reload, 'service[logstash]'
end

service "logstash" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end
