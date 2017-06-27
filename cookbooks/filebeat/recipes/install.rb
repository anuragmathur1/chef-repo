package "filebeat" do
  action :install
end

template "/etc/filebeat/filebeat.yml" do
  source "filebeat.yml.erb"
  notifies :reload, 'service[filebeat]'
end

service "filebeat" do
  action [:enable, :start]
end
