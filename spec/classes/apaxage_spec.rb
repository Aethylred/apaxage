require 'spec_helper'
describe 'apaxage', :type => :class do
  context 'on a Debian OS' do
    let :facts do
      {
        :osfamily         => 'Debian',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
        :fqdn                   => 'test.example.org',
      }
    end
    let :pre_condition do 
            "include apache\ninclude apaxy"
    end
    describe "with no parameters" do
      it { should include_class('apaxage::params') }
    end
  end

  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily   => 'RedHat',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
        :fqdn                   => 'test.example.org',
      }
    end
    describe "with no parameters" do
      it { should include_class('apaxage::params') }
    end
  end

  context "on an Unknown OS" do
    let :facts do
      {
        :osfamily   => 'Unknown',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
        :fqdn                   => 'test.example.org',
      }
    end
    # The Apache class fails first.
    # it do
    #   expect {
    #     should include_class('puppet::params')
    #   }.to raise_error(Puppet::Error, /The apaxy class is not configured for Unknown distributions./)
    # end
  end

end