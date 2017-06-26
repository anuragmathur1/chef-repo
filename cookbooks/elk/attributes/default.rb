default['elk']['version'] = "5.x"
default['elasticsearch']['home'] = '/usr/share/elasticsearch/'

default['logs']['web_access']['bucket'] = 'monitor-elmo-dev'
default['logs']['web_error']['bucket'] = 'monitor-elmo-dev'
default['logs']['app']['bucket'] = 'monitor-elmo-dev'

default['logstash']['reload_automatic'] = 'true'
default['logstash']['reload_interval'] = '3'

default['es']['cluster']['name'] = 'elmo-elk-cluster'
default['es']['cluster']['ip'] = '0.0.0.0'
default['master_nodes']['min'] = '1'
default['xpack']['notification']['username'] = 'sample@example.com'
default['xpack']['notification']['password'] = 'samplepass'
default['xpack']['notification']['port'] = '578'
default['xpack']['notification']['host'] = 'smtp.gmail.com'

default['kibana']['server_host'] = '0.0.0.0'
default['kibana']['elasticsearch']['url'] = 'http://localhost:9200'
default['kibana']['elasticsearch']['username'] = 'elastic'
default['kibana']['elasticsearch']['password'] = 'changeme'
