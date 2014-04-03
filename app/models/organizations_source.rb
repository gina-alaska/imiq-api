class OrganizationsSource < ActiveRecord::Base
  self.table_name = 'organizations'

  belongs_to :network, foreign_key: 'networkid'
  belongs_to :organization, foreign_key: 'organizationid'
  belongs_to :source, foreign_key: 'sourceid'
end
