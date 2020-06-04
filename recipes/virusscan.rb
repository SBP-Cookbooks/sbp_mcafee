#
# Cookbook:: sbp_mcafee
# Recipe:: default
#
# Copyright:: 2020, Schuberg Philis
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['mcafee']['virusscan']['url'].nil?
  Chef::Log.warn "Attribute node['mcafee']['virusscan']['url'] is empty, so package \"#{node['mcafee']['virusscan']['package_name']}\" will not be installed"
  return
end

require 'chef/util/path_helper'

is_mcafee_vs_installed = is_package_installed?(node['mcafee']['virusscan']['package_name'])

windows_zipfile File.join(Chef::Config[:file_cache_path], node['mcafee']['virusscan']['package_name']) do
  source node['mcafee']['virusscan']['url']
  checksum node['mcafee']['virusscan']['checksum'] if node['mcafee']['virusscan']['checksum']
  action :unzip
  not_if { is_mcafee_vs_installed }
  notifies :install, "windows_package[#{node['mcafee']['virusscan']['package_name']}]", :immediately
end

package = Chef::Util::PathHelper.cleanpath(File.join(Chef::Config[:file_cache_path], node['mcafee']['virusscan']['package_name'], node['mcafee']['virusscan']['installer_exe']))

windows_package node['mcafee']['virusscan']['package_name'] do
  source package
  options node['mcafee']['virusscan']['options']
  timeout node['mcafee']['virusscan']['installer_timeout'].to_i
  installer_type :custom
  action :nothing
end

directory File.join(Chef::Config[:file_cache_path], node['mcafee']['virusscan']['package_name']) do
  recursive true
  action :delete
end
