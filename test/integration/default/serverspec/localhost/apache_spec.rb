require_relative '../spec_helper'

# ----------------------------
# Apache2 setup
# ----------------------------

describe package('apache2') do
  it { should be_installed.by('apt') }
end

describe file('/etc/apache2/ports.conf') do
  it { should contain 'Listen 4280' }
end

describe service('apache2') do
  it { should be_running }
end

describe file('/var/www/html/data') do
  it { should be_directory }
end

describe file('/home/vagrant/.ssh/authorized_keys') do
  it { should exist }
  it { should be_owned_by 'vagrant' }
  its(:content) { should match 'jenkins' }
end
