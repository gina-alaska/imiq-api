class HourlyAirtemp < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns  
  
  self.table_name = 'hourly_airtemp'
end
