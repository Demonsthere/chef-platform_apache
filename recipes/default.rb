#
# Cookbook Name:: chef-platform_apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apt'

include_recipe 'apache2'

cookbook_file '/tmp/authorized_keys' do
  source 'authorized_keys'
  owner node[:platform_apache][:user]
  group node[:platform_apache][:user]
  mode '0600'
end

bash 'append_shh_keys' do
  user node[:platform_apache][:user]
  cwd '/tmp'
  code <<-EOH
    cat /tmp/authorized_keys >> ~/.ssh/authorized_keys
    rm /tmp/authorized_keys
  EOH
end
