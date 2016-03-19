#
# Cookbook Name:: chef-platform_apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apache2'

cookbook_file '/home/vagrant/.ssh/authorized_keys' do
  source 'authorized_keys'
  owner 'vagrant'
  group 'vagrant'
  mode '0600'
end
