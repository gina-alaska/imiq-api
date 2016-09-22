set :application, 'imiq-api'
set :repo_url, 'https://github.com/gina-alaska/imiq-api.git'

ask :branch, proc { `cat VERSION`.chomp }

set :deploy_to, '/www/imiq_api'
set :scm, :git

set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml config/initializers/secret_token.rb .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets solr vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    puts "We currently don't have support for auto restarting, please login and run 'sudo service unicorn restart'"
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      # within release_path do
      #   execute :rake, 'sunspot:solr:stop'
      #   execute :rake, 'sunspot:solr:start'
      # end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
    end
  end

  after :finishing, 'deploy:cleanup'

end
