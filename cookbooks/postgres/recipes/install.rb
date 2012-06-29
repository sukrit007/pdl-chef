#
# Cookbook Name:: postgres
# Recipe:: install
#
# Copyright 2012, Pearson
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info node.keys


Chef::Log.info "Installing Postgres on #{node["platform"]}-#{node["platform_version"]}.  Previous Install:#{node["postgresql"]["install"]}"

case node["platform"] 
when "centos"
  raise "Unsupported CentOS version:#{node["platform_version"]}" unless (5.0...6.0).include? node["platform_version"].to_f 
     
when "ubuntu"
  raise "Unsupported Ubuntu version:#{node["platform_version"]}" unless (12.0...13.0).include? node["platform_version"].to_f 
  Chef::Log.info "Skip pgdg on Ubuntu"
else
    
    raise "Unsupported Platform"
end




cookbook_file "/tmp/pgdg.rpm" do
  action :create
  source node["pgdg"]  
  only_if { node["platform"] == "centos" }
end

 
package "pgdg" do
  action :install
  source "/tmp/pgdg.rpm"
  provider Chef::Provider::Package::Rpm
  options "-v -h"
  only_if { node["platform"] == "centos" }
  #flush_cache :after => true
end   

package node["postgresql"]["package"]["base"] do
  action :install
  options "--nogpgcheck"
end

package node["postgresql"]["package"]["server"] do
  action :install
  options "--nogpgcheck"
  only_if { node["platform"] == "centos" }  
  
end

package node["postgresql"]["package"]["libs"] do
  action :install 
  options "--nogpgcheck"
  only_if { node["platform"] == "centos" } 
end

package node["postgresql"]["package"]["contrib"] do
  action :install  
  options "--nogpgcheck" 
end

package node["postgresql"]["package"]["devel"] do
  action :install
  options "--nogpgcheck"
  only_if { node["platform"] == "centos" }  
end


ruby_block "postgres_install_successful" do
  block do
    node.set["postgresql"]["install"]=true
    node.save
  end
  only_if { node["postgresql"]["save-node-config"]}
end


  
