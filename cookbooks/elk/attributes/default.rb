default['elk']['version'] = "5.x"
default['elasticsearch']['home'] = '/usr/share/elasticsearch/'
default['elasticsearch']['version'] = '5.4.3-1'
default['elasticsearch']['hostname'] = 'localhost'
default['kibana']['version'] = '5.4.3-1'
default['logstash']['version'] = '5.4.3-1'

default['logs']['web_access']['bucket'] = 'monitor-elmodev-com'
default['logs']['web_error']['bucket'] = 'monitor-elmodev-com'
default['logs']['app']['bucket'] = 'monitor-elmodev-com'

default['logstash']['reload_automatic'] = 'true'
default['logstash']['reload_interval'] = '3'
default['logstash']['logdir'] = '/var/log/logstash'

default['es']['cluster']['name'] = 'elmo-elk-cluster'
default['es']['cluster']['ip'] = '0.0.0.0'
default['master_nodes']['min'] = '1'
default['xpack']['notification']['username'] = 'sample@example.com'
default['xpack']['notification']['password'] = 'samplepass'
default['xpack']['notification']['port'] = '578'
default['xpack']['notification']['host'] = 'smtp.gmail.com'
default['xpack']['notification']['profile'] = 'gmail'

default['kibana']['server_host'] = '0.0.0.0'
default['kibana']['elasticsearch']['url'] = 'http://localhost:9200'
default['kibana']['elasticsearch']['username'] = 'elastic'
default['kibana']['elasticsearch']['password'] = 'changeme'
