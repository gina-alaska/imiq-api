class Metadata < ActiveRecord::Base
  self.table_name = "isometadata"
  
  validates :metadatalink, length: { maximum: 500 }
end
