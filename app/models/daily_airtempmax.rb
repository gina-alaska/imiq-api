class DailyAirtempmax < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns 

  belongs_to :unit, foreign_key: 'variableunitsid'
  
  self.table_name = 'daily_airtempmax'
end
