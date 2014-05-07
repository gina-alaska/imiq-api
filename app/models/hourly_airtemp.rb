class HourlyAirtemp < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns  
  
  belongs_to :unit, foreign_key: 'variableunitsid'
  
  self.table_name = 'hourly_airtemp'
end
