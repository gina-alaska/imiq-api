require File.expand_path('../support/helpers', __FILE__)

describe 'imiq_api' do
  include Helpers::Imiq_api_cookbook

  # Example spec tests can be found at http://git.io/Fahwsw
  describe 'sunspot' do    
    it 'should create the sunspot config' do
      file(sunspot_config_file).must_exist.with(:owner, node['imiq_api']['account'])
    end    
  end
end
