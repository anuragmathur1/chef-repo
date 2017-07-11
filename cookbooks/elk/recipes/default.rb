#
# Cookbook:: elk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe "elk::openjdk"
include_recipe "elk::elk-repo-setup"
include_recipe "elk::elasticsearch"
include_recipe "elk::logstash"
include_recipe "elk::kibana"
include_recipe "elk::create-es-watcher"
include_recipe "elk::xpack"
