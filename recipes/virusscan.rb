#
# Cookbook Name:: sbp_mcafee
# Recipe:: default
#
# Copyright 2013, Schuberg Philis B.V.
#
# All rights reserved - Do Not Redistribute
#

if node['mcafee']['virusscan']['url'].nil?
  Chef::Log.warn "Attribute node['mcafee']['virusscan']['url'] is empty, so package \"#{node['mcafee']['virusscan']['package_name']}\" will not be installed"
  return
end

::Chef::Recipe.send(:include, Windows::Helper)

is_mcafee_vs_installed = is_package_installed?(node['mcafee']['virusscan']['package_name'])
windows_zipfile File.join(Chef::Config[:file_cache_path], node['mcafee']['virusscan']['package_name']) do
  source node['mcafee']['virusscan']['url']
  checksum node['mcafee']['virusscan']['checksum'] if node['mcafee']['virusscan']['checksum']
  action :unzip
  not_if { is_mcafee_vs_installed }
  notifies :install, "windows_package[#{node['mcafee']['virusscan']['package_name']}]", :immediately
end

package = win_friendly_path(File.join(Chef::Config[:file_cache_path], node['mcafee']['virusscan']['package_name'], node['mcafee']['virusscan']['installer_exe']))
windows_package node['mcafee']['virusscan']['package_name'] do
  source package
  options node['mcafee']['virusscan']['options']
  timeout node['mcafee']['virusscan']['installer_timeout'].to_i
  installer_type :custom
  action :install
end

directory File.join(Chef::Config[:file_cache_path], node['mcafee']['virusscan']['package_name']) do
  recursive true
  action :delete
end
