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

if node['mcafee']['agent']['url'].nil?
  Chef::Log.warn "Attribute node['mcafee']['agent']['url'] is empty, so package \"#{node['mcafee']['agent']['package_name']}\" will not be installed"
  return
end

windows_package node['mcafee']['agent']['package_name'] do
  source node['mcafee']['agent']['url']
  checksum node['mcafee']['agent']['checksum'] if node['mcafee']['agent']['checksum']
  options node['mcafee']['agent']['options']
  installer_type :custom
  timeout 1200
  action :install
end
