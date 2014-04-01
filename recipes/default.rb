#
# Cookbook Name:: sbp_mcafee
# Recipe:: default
#
# Copyright 2014, Schuberg Philis
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

if node['mcafee']['agent']['url'] == '' || node['mcafee']['virusscan']['url'] == ''
  raise "The node['mcafee']['agent']['url'] and node['mcafee']['virusscan']['url'] attributes must specify valid download URLs!"
end

windows_package node['mcafee']['agent']['package_name'] do
  source node['mcafee']['agent']['url']
  checksum node['mcafee']['agent']['checksum']
  options '/Install=Agent /Silent'
  installer_type :custom
  action :install
end

windows_zipfile File.join(Chef::Config[:file_cache_path], 'McAfee') do
  source node['mcafee']['virusscan']['url']
  checksum node['mcafee']['virusscan']['checksum']
  action :unzip
  not_if { Chef::Provider::WindowsPackage.new(nil, run_context).send(:installed_packages).include?(node['mcafee']['virusscan']['package_name']) }
  notifies :install, "windows_package[#{node['mcafee']['virusscan']['package_name']}]", :immediately
end

windows_package node['mcafee']['virusscan']['package_name']  do
  source File.join(Chef::Config[:file_cache_path], 'McAfee\SetupVSE.exe')
  options 'ADDLOCAL=ALL RUNAUTOUPDATESILENTLY=True REMOVE=LotusNotesScan REBOOT=R /qn'
  installer_type :custom
  action :nothing
end

directory File.join(Chef::Config[:file_cache_path], 'McAfee') do
	recursive true
	action :delete
end
