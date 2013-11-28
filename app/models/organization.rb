class Organization < ActiveRecord::Base
  self.table_name = 'organizationdescriptions'
  
  has_many :organizations_sources, foreign_key: 'organizationid'
  has_many :sources, through: :organizations_sources
  has_many :sites, through: :sources
  
  
  def description_with_code
    "#{organizationcode} - #{organizationdescription}"
  end
end
