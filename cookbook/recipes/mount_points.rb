app_name = 'imiq_api'

service 'rpcbind' do
  action [:enable, :start]
end

node[app_name]['mounts'].each do |mnt|
  directory mnt['destination'] do
    action :create
    recursive true
  end
  mount mnt['destination'] do
    device mnt['device']
    fstype mnt['fstype']
    options mnt['options']
    action mnt['action']
  end
end