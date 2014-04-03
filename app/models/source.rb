class Source < ActiveRecord::Base
  has_many :sites, foreign_key: 'sourceid'
  belongs_to :metadata, foreign_key: 'metadataid'
  has_many :organizations_sources, foreign_key: 'sourceid'
  has_many :networks, through: :organizations_sources, uniq: true
  has_many :organizations, through: :organizations_sources, uniq: true
  
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
