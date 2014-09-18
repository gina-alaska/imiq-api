app_path '/www/imiq_api/current'
chruby.environment 2.1
startup ['bundle install', 'service unicorn start']
