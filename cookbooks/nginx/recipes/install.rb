if node[:platform_family].include?("rhel")
  template "/etc/yum.repos.d/nginx.repo" do
    Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
    command = 'rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)'
    #puts command
    command_out = shell_out(command)
    #puts command_out
    #puts command_out.stdout
    node.default['os_major_release'] = command_out.stdout
    #puts node.default['os_major_release']
    source "nginx.repo.erb"
    variables({
      node_platform: node['platform'],
      #platform_version: node['platform_version'],
      os_ver: node['os_major_release'],
      #os_ver: command_out.stdout,
      #lazy { {os_version: shell_out!('rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)').stdout} }
      node_arch: node["kernel"]["machine"]
      })
  end
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable, :start]
end
