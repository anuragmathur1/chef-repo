package "kibana" do
  action :install
end

template "/etc/kibana/kibana.yml" do
  source "kibana.yml.erb"
  variables({
    server_host: node['kibana']['server_host'],
    es_url: node['kibana']['elasticsearch']['url'],
    es_username: node['kibana']['elasticsearch']['username'],
    es_password: node['kibana']['elasticsearch']['password']
    })

  notifies :reload, 'service[kibana]'
end

service "kibana" do
  action [:enable, :start]
end
