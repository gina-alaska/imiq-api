include_recipe 'imiq_api::bundler'
include_recipe 'imiq_api::capistrano'

app_name = 'imiq_api'
account = node[app_name]['account']

template "#{node[app_name]['paths']['shared']}/config/database.yml" do
  owner account
  group account
  mode 00644
  variables({
    databases: node[app_name]['database']
  })
end

template "#{node[app_name]['paths']['config']}/secrets.yml" do
  owner account
  group account
  mode 00644
    
  variables(node[app_name]["rails"])
end

# no longer needed
# template "#{node[app_name]['shared_path']}/config/initializers/secret_token.rb" do
#   owner account
#   group account
#   mode 00644
#   variables(node[app_name]["rails"])
# end