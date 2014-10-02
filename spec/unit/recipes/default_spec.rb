require 'spec_helper'

describe_recipe 'clang::default' do
  context 'with package install' do
    it { expect(chef_run).to install_package('clang') }
  end

  context 'ubuntu 12.04 binary install' do
    let(:chef_run) do
      ChefSpec::Runner.new(node_attributes) do |node|
        node.set['clang']['install_type'] = 'binary'
      end.converge(described_recipe)
    end

    it do
      expect(chef_run).to install_ark('clang')
        .with(url: 'http://llvm.org/releases/3.4.2/clang+llvm-3.4.2-x86_64-unknown-ubuntu12.04.tar.xz')
        .with(checksum: 'f27b94bd8826129aec34ea4e004c2cb92079c87a87b4afe9adcb650158088099')
        .with(version: '3.4.2')
        .with(append_env_path: true)
    end
  end

  context 'ubuntu 14.04 binary install' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.set['clang']['install_type'] = 'binary'
      end.converge(described_recipe)
    end

    it do
      expect(chef_run).to install_ark('clang')
        .with(url: 'http://llvm.org/releases/3.4.2/clang+llvm-3.4.2-x86_64-linux-gnu-ubuntu14.04.tar.xz')
        .with(checksum: 'ef0d8faeb31c731b46ef5859855766ec7eb71f9a32cc6407ac5ddb4ccc35c3dc')
        .with(version: '3.4.2')
        .with(append_env_path: true)
    end
  end

  context 'centos 7.0 binary install' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: '7.0') do |node|
        node.set['clang']['install_type'] = 'binary'
      end.converge(described_recipe)
    end

    it do
      expect(chef_run).to install_ark('clang')
        .with(url: 'http://llvm.org/releases/3.4.2/clang+llvm-3.4.2-x86_64-fedora20.tar.xz')
        .with(checksum: '6d8ff47a5a9926f65e2b2f92c9d2996c05db2aeff4d97c1a9cd0c6b19e865dfb')
        .with(version: '3.4.2')
        .with(append_env_path: true)
    end
  end
end
