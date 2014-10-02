#
# Cookbook Name:: clang
# Recipe:: default
# License:: Apache 2.0 (see http://www.apache.org/licenses/LICENSE-2.0)
#
package 'clang' do
  only_if { node['clang']['install_type'] == 'package' }
end

# Figure out the proper download URL and checksum value depending on the
# platform and version that is being specified.
url_options = { version: node['clang']['source_version'] }
source_checksum = node['clang']['source_checksum']

if node['clang']['install_type'] == 'source'
  case node['platform']
  when 'ubuntu'
    if node['platform_version'] == '12.04'
      url_options[:platform] = 'x86_64-unknown-ubuntu12.04'
      source_checksum = 'f27b94bd8826129aec34ea4e004c2cb92079c87a87b4afe9adcb650158088099'
    elsif node['platform_version'] == '14.04'
      url_options[:platform] = 'x86_64-linux-gnu-ubuntu14.04'
      source_checksum = 'ef0d8faeb31c731b46ef5859855766ec7eb71f9a32cc6407ac5ddb4ccc35c3dc'
    end
  when 'redhat', 'centos', 'fedora'
    url_options[:platform] = 'x86_64-fedora20'
    source_checksum = '6d8ff47a5a9926f65e2b2f92c9d2996c05db2aeff4d97c1a9cd0c6b19e865dfb'
  end

  ark 'clang' do
    version node['clang']['source_version']
    url node['clang']['source_url'] % url_options
    checksum source_checksum
    append_env_path true
  end
end
