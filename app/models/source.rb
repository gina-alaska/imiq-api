class Source < ActiveRecord::Base
  has_many :sites, foreign_key: 'sourceid'  
  
  # Override the default as_json method to set our default values
  def as_json(opts = nil)
    opts ||= {}
    #opts[:include] ||= []
    #opts[:include] << :source
    
    #opts[:except] ||= []
    #opts[:except] << :sourceid
    
    super(opts)
  end
  
end
