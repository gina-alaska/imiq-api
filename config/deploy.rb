set :application, 'imiq-api'
set :repo_url, 'https://github.com/gina-alaska/imiq-api.git'

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/www/imiq_api'
set :scm, :git

set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml config/initializers/secret_token.rb}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle vendor/assets/bower_components public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
  desc 'Deploy bower components'
  before :updated, :bower do
    on roles(:web), in: :sequence, wait: 5 do
      within release_path do
        execute :rake, 'bower:install'
      end
    end
  end
  
  desc 'Restart application'
  task :restart do
    puts "We currently don't have support for auto restarting, please login to browse-web0 and run 'sudo service unicorn_browser_ng restart'"
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
