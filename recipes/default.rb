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


if node['sahi']['with_phantomjs']
  package "phantomjs"
end
if node['sahi']['with_firefox']
  include_recipe "sahi::firefox"
end


# yum::epel et yum::remi should be in run list
#include_recipe "yum"

## Deps
package "unzip"
### 
# Sahi itself
# download install zip

sahiuser = node["sahi"]["user"]
user sahiuser do
  action :create
end

zipfile = "#{Chef::Config[:file_cache_path]}/sahi.zip"
sahipath = node["sahi"]["path"]

remote_file zipfile do
  source node['sahi']['download_url']
end
directory sahipath do
  owner sahiuser
  group sahiuser
end
execute "unzip sahi" do
  # not_if
  # creates path/machin/truc.sh
  command "unzip -q -u -o #{zipfile} -d #{sahipath}"
  user sahiuser 
end




# Configure browser_type 
template "#{sahipath}/sahi/userdata/config/browser_types.xml" do
  source "browser_types.xml.erb"
  user  sahiuser
  group sahiuser
end

#  start proxy/daemon?



# Expose test, script??

