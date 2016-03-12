require_relative '../spec_helper'

# ----------------------------
# Apache2 setup
# ----------------------------

describe package('apache2') do
  it { should be_installed.by('apt') }
end

describe file('/etc/apache2/ports.conf') do
  it { should contain 'Listen *:80' }
end

describe service('apache2') do
  it { should be_running }
end

describe file('/var/www/html/data') do
  it { should be_directory }
end
