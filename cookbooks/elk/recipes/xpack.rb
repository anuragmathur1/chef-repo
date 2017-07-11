execute "kibana-x-pack" do
  not_if { Dir.exist?("/usr/share/kibana/plugins/x-pack")}
  ignore_failure true
  command '/usr/share/kibana/bin/kibana-plugin install x-pack'

  notifies :restart, 'service[kibana]'
end

execute "logstash-x-pack" do
  ignore_failure true
  command '/usr/share/logstash/bin/logstash-plugin install x-pack'

  notifies :restart, 'service[logstash]'
end
