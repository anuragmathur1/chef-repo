package "php-fpm"

template "/etc/php.ini" do
  source "php.ini.erb"
end

service "php-fpm" do
  action [:enable, :start]
end
