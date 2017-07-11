package "logstash" do
  version node['logstash']['version']
  action :install
end

template "/etc/logstash/logstash.yml" do
  source "logstash.yml.erb"
  variables({
    logstash_reload_automatic: node['logstash']['reload_automatic'],
    logstash_reload_interval: node['logstash']['reload_interval'],
    logstash_logdir: node['logstash']['logdir']
    })
    notifies :reload, 'service[logstash]'
end


bash "install_geoip" do
#  cwd ::File.dirname("/etc/logstash")
  code <<-EOH
    wget -O /etc/logstash/GeoLite2-City.mmdb.gz http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
    echo "Runnig  the BASH script"
    gunzip /etc/logstash/GeoLite2-City.mmdb.gz
  EOH
  not_if { ::File.exist?("etc/logstash/GeoLite2-City.mmdb") }
end


template "/etc/logstash/conf.d/logstash.conf" do
  source "logstash.conf.erb"
  variables({
    #region: node["opsworks"]["instance"]["region"],
    #region: node["ec2"]["region"],
    region: "ap-southeast-2"
    apache_access_bucket: node["logs"]["web_access"]["bucket"],
    apache_error_bucket: node["logs"]["web_error"]["bucket"],
    app_log_bucket: node["logs"]["app"]["bucket"],
    elasticsearch_host: node['elasticsearch']['hostname']
    })
    notifies :reload, 'service[logstash]'
end

service "logstash" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end
