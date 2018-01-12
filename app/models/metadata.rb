class Metadata < ApplicationRecord
  self.table_name = "isometadata"
  
  has_many :sources, foreign_key: 'metadataid'
  has_many :sites, through: :sources
  
  validates :metadatalink, length: { maximum: 500 }
end
