#  Assuming webapp might use this variable at some point.
default['unicorn_config_path'] = '/etc/unicorn'

default['imiq_api']['application_path'] = "/www/imiq_api"
default['imiq_api']['shared_path'] = "#{default['imiq_api']['application_path']}/shared"
default['imiq_api']['config_path'] = "#{default['imiq_api']['shared_path']}/config"
default['imiq_api']['initializers_path'] = "#{default['imiq_api']['config_path']}/initializers"
default['imiq_api']['deploy_path'] = "#{default['imiq_api']['application_path']}/current"

default['imiq_api']['account'] = "webdev"

default['imiq_api']['database']['adapter']  = "postgresql"
default['imiq_api']['database']['hostname'] = "imiqdb.gina.alaska.edu"
default['imiq_api']['database']['database'] = "iarcod_current"
default['imiq_api']['database']['username'] = "imiq"
default['imiq_api']['database']['password'] = ""
default['imiq_api']['database']['search_path'] = "tables,views,public"

default['imiq_api']['rails']['secret'] = '87cf47e2b8a1739b63efc4ff2cae7a749af099803f6d93f832004f7b7b5c36599829e84448ed2a5a2a6f15413f664f960c6ee8b999b30e9cc1b4ba37a96a1d90'
default['imiq_api']['rails']['application_class_name'] = 'ImiqApi'


default['imiq_api']['before_fork'] = '
defined?(ActiveRecord::Base) and
   ActiveRecord::Base.connection.disconnect!
   
   old_pid = "#{server.config[:pid]}.oldbin"
   if old_pid != server.pid
     begin
       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
       Process.kill(sig, File.read(old_pid).to_i)
     rescue Errno::ENOENT, Errno::ESRCH
     end
   end
      
sleep 1
'

default['imiq_api']['after_fork'] = "
defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection
"

default['imiq_api']['package_deps'] = %w{libicu-devel curl-devel libxml2-devel libxslt-devel nfs-utils ImageMagick-devel nodejs npm}
default['imiq_api']['npm_deps'] = %w{bower}

default['users'] ||= []
%w{ webdev }.each do |user|
  default['users'] << user unless default['users'].include?(user)
end
