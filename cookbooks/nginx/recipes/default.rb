#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe "nginx::install"
include_recipe "nginx::php-fpm"
include_recipe "nginx::nginx_setup"
#include_recipe "nginx::php_setup"
