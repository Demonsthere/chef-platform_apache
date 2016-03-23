#
# Cookbook Name:: chef-platform_apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'apache2'

cookbook_file '/tmp/authorized_keys' do
  source 'authorized_keys'
  owner 'vagrant'
  group 'vagrant'
  mode '0600'
end

bash 'append_shh_keys' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    cat /tmp/authorized_keys >> /home/vagrant/.ssh/authorized_keys
    rm /tmp/authorized_keys
  EOH
end
