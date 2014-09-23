#
# Cookbook Name:: imiq_api-cookbook
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "imiq_api::packages"
include_recipe "imiq_api::ruby"
include_recipe "imiq_api::nginx"
include_recipe "postgresql::client"
include_recipe "imiq_api::rails"
include_recipe "imiq_api::unicorn"
include_recipe "imiq_api::sunspot"
