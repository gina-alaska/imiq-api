class HourlyWindspeed < ApplicationRecord
  include DerivedModelConcerns
  include HourlyModelConcerns   
  
  self.table_name = 'hourly_windspeed'
end
