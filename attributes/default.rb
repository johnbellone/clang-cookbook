#
# Cookbook Name:: clang
# Attribute:: default
# License:: Apache 2.0 (see http://www.apache.org/licenses/LICENSE-2.0)
#
default['clang']['install_type'] = 'package'

default['clang']['package_version'] = '3.5'
default['clang']['package_repo_distribution'] = node['lsb']['codename']

default['clang']['binary_version'] = '3.4.2'
default['clang']['binary_url'] = "http://llvm.org/releases/%{version}/clang+llvm-%{version}-%{platform}.tar.xz"
