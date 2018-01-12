class HourlyAirtemp < ApplicationRecord
  include DerivedModelConcerns
  include HourlyModelConcerns  
  
  self.table_name = 'hourly_airtemp'
end
