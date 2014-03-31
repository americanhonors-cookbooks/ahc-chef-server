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

name             'ahc-chef-server'
maintainer       'Copyright (c) 2014 Quad Learning, Inc.'
maintainer_email 'techops@americanhonors.org'
license          'Apache 2.0'
description      'Installs and configures Chef Server on EC2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'aws'
depends 'chef-server'

%w(ubuntu).each do |os|
  supports os
end

recipe 'ahc-chef-server', 'Installs Chef Server.'
