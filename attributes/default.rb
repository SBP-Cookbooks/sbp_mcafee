#
# Cookbook Name:: sbp_mcafee
# Attribute:: default
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

default['mcafee']['agent']['package_name']      = 'McAfee Agent'
default['mcafee']['agent']['url']               = ''
default['mcafee']['agent']['checksum']          = ''
default['mcafee']['agent']['options']           = '/Install=Updater /Silent'
default['mcafee']['virusscan']['package_name']  = 'McAfee VirusScan Enterprise'
default['mcafee']['virusscan']['url']           = ''
default['mcafee']['virusscan']['checksum']      = ''
default['mcafee']['virusscan']['options']       = 'ADDLOCAL=ALL RUNAUTOUPDATESILENTLY=True REMOVE=ScriptScan,LotusNotesScan,EmailScan REBOOT=R /qn'
default['mcafee']['virusscan']['installer_timeout']   = '900'
