class Network < ApplicationRecord
  self.table_name = 'networkdescriptions'

  include Search::Networks
  
  has_many :organizations_sources, foreign_key: 'networkid'
  has_many :sources, through: :organizations_sources
  has_many :sites, through: :sources
  
  def description_with_code
    "#{networkcode} - #{networkdescription}"
  end
  
end
