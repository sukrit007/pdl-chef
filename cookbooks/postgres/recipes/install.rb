#
# Cookbook Name:: postgres
# Recipe:: install
#
# Copyright 2012, Pearson
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info node.keys


Chef::Log.info "Installing Postgres on #{node["platform"]}-#{node["platform_version"]}"

case node["platform"].downcase 
when "centos"
  raise "Unsupported CentOS version:#{node["platform_version"]}" unless (5.0...6.0).include? node["platform_version"].to_f 
  cookbook_file "/tmp/pgdg.rpm" do
    action :install
    source node["pgdg"]  
  end
  
  package "pgdg" do
    action :install
    source "/tmp/pgdg.rpm"
    provider Chef::Provider::Package::Rpm
  end   
   
when "ubuntu"
  raise "Unsupported Ubuntu version:#{node["platform_version"]}" unless (12.0...13.0).include? node["platform_version"].to_f 
  Chef::Log.info "Skip pgdg on Ubuntu"
else
    
    raise "Unsupported Platform"
end


package node["postgresql"]["package"] do
  action :install
  
end


  
