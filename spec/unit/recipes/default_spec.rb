#
# Copyright (c) Quad Learning, Inc.
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

require 'spec_helper'

describe 'ahc-chef-server::default' do
  let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }

  specify { expect(chef_run).to include_recipe('aws') }

  it 'creates a RAID-10 array on EBS for storage' do
    expect(chef_run).to auto_attach_aws_ebs_raid('chef-server').with(
      mount_point:       '/opt/chef-server',
      mount_point_owner: 'root',
      mount_point_group: 'root',
      mount_point_mode:  '0755',
      disk_count:        4,
      disk_size:         100,
      level:             10,
      disk_type:         'standard'
    )
  end

  it 'installs Chef Server' do
    expect(chef_run).to include_recipe('chef-server')
  end
end
