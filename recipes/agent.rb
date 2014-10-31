#
# Cookbook Name:: win_mcafee
# Recipe:: default
#
# Copyright 2013, Schuberg Philis B.V.
#
# All rights reserved - Do Not Redistribute
#

if node['mcafee']['agent']['url'] == ''
then

  Chef::Log.warn "Package \"#{node['mcafee']['agent']['package_name']}\" not available"

else

  windows_package node['mcafee']['agent']['package_name'] do
    source node['mcafee']['agent']['url']
    checksum node['mcafee']['agent']['checksum']
    options "/Install=Agent /Silent"
    installer_type :custom
    action :install
  end

end
