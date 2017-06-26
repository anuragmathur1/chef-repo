# package "expect" do
#   action :install
# end

# bash "es-x-pack" do
#
#   code <<-EOF
#
#     /usr/bin/expect -c 'spawn /usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack
#     expect "Continue with installation"
#     send "y\r"
#     expect "Continue with installation"
#     send "y\r"
#     expect eof'
#     EOF
#   end

# execute "es-x-pack" do
#   command '/usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack --batch'
# end

execute "kibana-x-pack" do
  command '/usr/share/kibana/bin/kibana-plugin install x-pack'
end

execute "logstash-x-pack" do
  command '/usr/share/logstash/bin/logstash-plugin install x-pack'
end
