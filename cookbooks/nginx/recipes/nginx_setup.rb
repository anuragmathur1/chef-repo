node['nginx']['site_names'].each do |site_name|
  template "/etc/nginx/conf.d/#{site_name}.conf" do
    source "nginx_default.conf.erb"
    variables({
      server_name: "#{site_name}",
      http_port: node['http']['port'],
      nginx_root: "#{node['nginx']['root']}#{site_name}",
      nginx_index_file: node['nginx']['index_file'],
      nginx_access_log: node['nginx']['access_log'],
      nginx_error_log: node['nginx']['error_log'],
      fastcgi_index: node['fastcgi_index']
      #site_names: node['nginx']['site_names']
      })
    notifies :reload, 'service[nginx]', :immediately
  end
end

template "/etc/nginx/fastcgi_params" do
  source "fastcgi_params.erb"

  notifies :reload, 'service[nginx]', :immediately
end
