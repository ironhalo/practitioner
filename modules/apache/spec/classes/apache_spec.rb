# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require 'spec_helper'

describe('apache', :type=> :class) do
  let(:node) { 'rspec.test.com' }

  describe 'when called with no params on redhat' do
    let(:facts) {{
      :osfamily => 'RedHat'
    }}

    it { should compile }

    it { should contain_package('apache').with_name('httpd') }

    it { should contain_file('apache_config').with(
      'ensure' => 'file',
      'path'   => '/etc/httpd/conf/httpd.conf',
      'source' => 'puppet:///modules/apache/RedHat.conf',
      )
    }

  end

end
