execute "Install Public signing key" do
  command 'rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch'
end

cookbook_file '/etc/yum.repos.d/logstash.repo' do
  source 'logstash.repo'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

package logstash do
  action :install
end
