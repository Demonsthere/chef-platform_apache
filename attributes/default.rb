default[:platform_apache][:user] = 'vagrant'
default[:platform_apache][:port] = 4280
force_override[:apache][:listen] = ["*:#{node[:platform_apache][:port]}"]
