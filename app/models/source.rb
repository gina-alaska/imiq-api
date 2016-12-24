class Source < ActiveRecord::Base
  include Search::Sources

  has_many :sites, foreign_key: 'sourceid'
  belongs_to :metadata, foreign_key: 'metadataid'
  has_many :organizations_sources, foreign_key: 'sourceid'
  has_many :networks, -> { uniq }, through: :organizations_sources
  has_many :organizations, -> { uniq }, through: :organizations_sources
  
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
