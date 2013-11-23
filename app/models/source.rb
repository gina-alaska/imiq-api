class Source < ActiveRecord::Base
  has_many :sites, foreign_key: 'sourceid'
  belongs_to :metadata, foreign_key: 'metadataid'
end
