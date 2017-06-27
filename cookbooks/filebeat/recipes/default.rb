#
# Cookbook:: filebeat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe "filebeat::elk-repo-setup"
include_recipe "filebeat::install"
