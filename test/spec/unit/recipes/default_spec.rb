#
# Cookbook:: sbp_mcafee
# Spec:: default
#
# Copyright:: 2014-2017, Schuberg Philis
#

require 'spec_helper'

describe 'sbp_mcafee::default' do
  context 'when all attributes are default, on a windows 2012 r2 system' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'windows', platform_family: 'windows', version: '2012R2'
      )
      runner.converge(described_recipe)
    end

    it 'should converge successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'when attributes are set, on a windows 2012 r2 system' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'windows', platform_family: 'windows', version: '2012R2') do |node|
        node.normal['mcafee']['agent']['url'] = 'http://server/framepkg.exe'
        node.normal['mcafee']['virusscan']['url'] = 'http://server/virusscan.zip'
      end.converge(described_recipe)
    end

    before do
      allow_any_instance_of(Chef::Resource::WindowsZipfile).to receive(:is_package_installed?).and_return(false)
    end

    it 'should converge successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
