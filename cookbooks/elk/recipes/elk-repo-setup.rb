execute 'elk-repo-gpg-import' do
  command 'rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch'
end

template "/etc/yum.repos.d/elk.repo" do
  Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
  command = 'rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)'
  command_out = shell_out(command)
  node.default['os_major_release'] = command_out.stdout
  source "elk.repo.erb"
  variables({
    node_platform: node['platform'],
    os_major_version: node['os_major_release'],
    node_arch: node["kernel"]["machine"]
    })
end
