default['http']['port'] = '80'
default['nginx']['root'] = '/usr/share/nginx/html/'
default['nginx']['index_file'] = 'index.php'
default['nginx']['error_file'] = 'error.html'
default['nginx']['access_log'] = '/var/log/nginx/log/host.access.log'
default['nginx']['error_log'] = '/var/log/nginx/log/host.error.log'
default['fastcgi_index'] = 'index.php'
default['nginx']['site_names'] = [ "test1.localhost.com", "test2.localhost.com" ]
