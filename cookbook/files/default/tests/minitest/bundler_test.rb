require File.expand_path('../support/helpers', __FILE__)

describe 'imiq_api' do
  include Helpers::Imiq_api_cookbook

  # Example spec tests can be found at http://git.io/Fahwsw
  describe 'bundler' do
    it 'should create the .bundle/config file' do
      file(bundle_config_file).must_exist.with(:owner, node['imiq_api']['account'])
    end    
  end
end
