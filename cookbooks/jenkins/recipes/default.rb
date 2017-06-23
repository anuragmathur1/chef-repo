#
# Cookbook:: jenkins
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

remote_file '/etc/yum.repos.d/jenkins.repo' do
  source 'https://pkg.jenkins.io/redhat-stable/jenkins.repo'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'jenkins-repo-gpg-import' do
  command 'rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key'
end

package 'jenkins' do
  action :install
end

service 'jenkins' do
  action [:enable,:start]
end

time = Time.now.to_i
template "/var/lib/jenkins/users/admin/config.xml" do
  source "admin_config.xml.erb"
  variables({
    :time => time
  })
  notifies :restart, 'service[jenkins]', :immediately
end
