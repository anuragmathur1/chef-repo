template "/var/awslogs/etc/awslogs.conf" do
  cookbook "cloudwatch-agent"
  source "awslogs.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables ( {
    log_names: node['log_names'],
    log_stream_name: node['log_stream_name']
    })

  notifies :restart, 'service[awslogs]', :immediately
end

service 'awslogs' do
  action [:enable, :start]
end
