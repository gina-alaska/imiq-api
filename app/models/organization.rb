class Organization < ActiveRecord::Base
  self.table_name = 'organizationdescriptions'
  
  include Search::Organizations
  
  has_many :organizations_sources, foreign_key: 'organizationid'
  # don't tie together networks and organizations (even though it uses the same join table)
  # has_many :networks, through: :organizations_sources
  has_many :sources, through: :organizations_sources
  has_many :sites, through: :sources
  
  
  def description_with_code
    "#{organizationcode} - #{organizationdescription}"
  end
end
