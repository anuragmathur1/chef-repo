#
# Cookbook:: open-jdk8
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'java-1.8.0-openjdk.x86_64'

execute 'alternatives-java' do
  command 'alternatives --install /usr/bin/java java /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-3.b12.el7_3.x86_64/bin/java 200000'
end

execute 'alternatives-javac' do
  command 'alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.131-3.b12.el7_3.x86_64/bin/javac 200000'
end
