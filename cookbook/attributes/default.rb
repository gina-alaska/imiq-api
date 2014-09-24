default['imiq_api']['paths'] = {
  application:        '/www/imiq_api',
  deploy:             '/www/imiq_api/current',
  shared:             '/www/imiq_api/shared',
  config:             '/www/imiq_api/shared/config',
  public:             '/www/imiq_api/shared/public',
  log:                '/www/imiq_api/shared/log',
  tmp:                '/www/imiq_api/shared/tmp',
  pids:               '/www/imiq_api/shared/tmp/pids',
  sockets:            '/www/imiq_api/shared/tmp/sockets'
}

default['imiq_api']['account'] = "webdev"
default['imiq_api']['environment'] = "production"

# default['imiq_api']['database']['adapter']  = "postgresql"
# default['imiq_api']['database']['hostname'] = ""
# default['imiq_api']['database']['database'] = "iarcod"
# default['imiq_api']['database']['username'] = "imiq"
# default['imiq_api']['database']['password'] = ""
# default['imiq_api']['database']['search_path'] = "tables,views,public"

default['imiq_api']['database'] = {
  setup: false,
  environments: [:development, :test],
  development: {
    adapter: 'postgresql',
    hostname: 'imiqdb.gina.alaska.edu',
    database: 'iarcod',
    username: 'imiq',
    password: '',
    search_path: 'tables,views,public'
  },
  test: {
    adapter: 'postgresql',
    hostname: 'localhost',
    database: 'iarcod_test',
    username: 'imiq',
    password: 'fj329rghDDw02jf',
    search_path: 'tables,views,public'    
  },
  production: {
    adapter: 'postgresql',
    hostname: 'imiqdb.gina.alaska.edu',
    database: 'iarcod',
    username: 'imiq',
    password: '',
    search_path: 'tables,views,public'
  }
}

default['imiq_api']['sunspot'] = {
  solr: {
    hostname: 'localhost',
    port: 8983,
    path: '/solr/default',
    log_level: 'INFO'
  }
}

default['imiq_api']['rails']['secret'] = '95cdd1a99dcb956797ee819b0565801427c68aaf963149e9e1dedfa232d9ee94ac0633fcf5104b976f8f01f752a4dceda27e1de846657ce79f9b01490bb16926'

default['unicorn']['preload_app'] = true
default['unicorn']['config_path'] = '/etc/unicorn/imiq_api.rb'
default['unicorn']['listen'] = "unicorn.socket"
default['unicorn']['pid'] = "unicorn.pid"
default['unicorn']['stderr'] = "unicorn.stderr.log"
default['unicorn']['stdout'] = "unicorn.stdout.log"
default['unicorn']['worker_timeout'] = 60
default['unicorn']['before_fork'] = '
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

default['unicorn']['after_fork'] = "
defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection

# If you are using Redis but not Resque, change this
# if defined?(Resque)
#   Resque.redis.client.reconnect
# end
"

default['imiq_api']['package_deps'] = %w{
  libicu-devel curl-devel libxml2-devel libxslt-devel nfs-utils ImageMagick-devel nodejs java-1.7.0-openjdk }