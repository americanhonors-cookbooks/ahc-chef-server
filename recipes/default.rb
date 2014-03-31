#
# Cookbook Name:: ahc-chef-server
# Recipe:: default
#
# Copyright (c) 2014 Quad Learning, Inc.
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

include_recipe 'aws'

aws_ebs_raid 'chef-server' do
  mount_point       '/opt/chef-server'
  mount_point_owner 'root'
  mount_point_group 'root'
  mount_point_mode  '0755'
  disk_count        node['ahc-chef-server']['raid']['disk_count']
  disk_size         node['ahc-chef-server']['raid']['disk_size']
  level             10
  disk_type         'standard'
end

include_recipe 'chef-server'
