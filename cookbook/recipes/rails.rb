include_recipe 'imiq_api::bundler'
include_recipe 'imiq_api::capistrano'

app_name = 'imiq_api'
account = node[app_name]['account']

template "#{node[app_name]['shared_path']}/config/database.yml" do
  owner account
  group account
  mode 00644
    
  variables(node[app_name]["database"])
end

template "#{node[app_name]['shared_path']}/config/initializers/secret_token.rb" do
  owner account
  group account
  mode 00644  
  variables(node[app_name]["rails"])
end