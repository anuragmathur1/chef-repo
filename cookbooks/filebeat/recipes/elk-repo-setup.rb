execute 'elk-repo-gpg-import' do
  command 'rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch'
end

template "/etc/yum.repos.d/elk.repo" do
  source "elk.repo.erb"
end
