package "java-1.7.0-openjdk" do
  only_if "rpm -q java-1.7.0-openjdk" 
  action :remove
end

package "java-1.8.0-openjdk" do
  action :install
end
