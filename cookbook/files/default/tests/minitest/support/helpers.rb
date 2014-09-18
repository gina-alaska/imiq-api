module Helpers
  module Imiq_api_cookbook
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources
    
    def sunspot_config_file
      File.join(node['imiq_api']['shared_path'], 'config/sunspot.yml')
    end
    
    def database_config_file
      File.join(node['imiq_api']['shared_path'], 'config/database.yml')
    end
    
    def secret_token_file
      File.join(node['imiq_api']['shared_path'], 'config/initializers/secret_token.rb')
    end
    
    def bundle_config_file
      "/home/#{node['imiq_api']['account']}/.bundle/config"
    end
    
    def bower_components_dir
      File.join(node['imiq_api']['shared_path'], 'vendor/assets/bower_components')
    end
  end
end
