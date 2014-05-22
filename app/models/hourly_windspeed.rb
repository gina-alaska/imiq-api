class HourlyWindspeed < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns   
  
  self.table_name = 'hourly_windspeed'
end
