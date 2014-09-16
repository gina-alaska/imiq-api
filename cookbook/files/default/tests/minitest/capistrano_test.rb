require File.expand_path('../support/helpers', __FILE__)

describe 'imiq_api' do
  include Helpers::Imiq_api_cookbook

  # Example spec tests can be found at http://git.io/Fahwsw
  describe 'capistrano' do
    it 'should create the application directory' do
      directory(node['imiq_api']['application_path']).must_exist.with(:owner, node['imiq_api']['account'])
    end
    
    it 'should create the shared directory' do
      directory(node['imiq_api']['shared_path']).must_exist.with(:owner, node['imiq_api']['account'])
    end
    
    it 'should create the bower_components directory' do
      directory(bower_components_dir).must_exist.with(:owner, node['imiq_api']['account'])
    end
  end
end
