#
# Cookbook Name:: sahi
# Recipe:: default
#
# Copyright (C) 2013 La Presse
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

include_recipe "java"

# yum::epel et yum::remi should be in run list
#include_recipe "yum"

## Deps
#
# Install firefox
package "firefox"
# install xvfb if needed


package value_for_platform_family(
  ["rhel", "fedora", "suse"] => "xorg-x11-server-Xvfb",
  ["debian","ubuntu"] => "xvfb"
)

# intall firefox / other browser
# download, save
# install x86 runtime
#sudo yum install glibc.i686
#sudo yum install libstdc++.i686
#sudo yum install glib2


### 
# Sahi itself
# download install zip
#
#  start proxy/daemon?



# Expose test, script??

