#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info "HAProxy : #{node["haproxy"]["action"]} ..."

package "haproxy" do
  action node["haproxy"]["action"]
end

Chef::Log.info 'Finished Installing HAProxy'

