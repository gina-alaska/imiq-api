class Network < ActiveRecord::Base
  self.table_name = 'networkdescriptions'
  
  has_many :organizations_sources, foreign_key: 'organizationid'
  has_many :sources, through: :organizations_sources
  has_many :sites, through: :sources
  
end
