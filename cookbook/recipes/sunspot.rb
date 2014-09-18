app_name = 'imiq_api'
account = node[app_name]['account']

template "#{node[app_name]['paths']['config']}/sunspot.yml" do
  owner account
  group account
  mode 00644
  variables({
    environment: node[app_name]['environment'],
    solr: node[app_name]['sunspot']['solr']
  })
end