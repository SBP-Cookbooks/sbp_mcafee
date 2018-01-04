#
# Cookbook Name:: sbp_mcafee
# Recipe:: default
#
# Copyright 2013, Schuberg Philis B.V.
#
# All rights reserved - Do Not Redistribute
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
