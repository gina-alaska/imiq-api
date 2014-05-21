class HourlyPrecip < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns 
  
  self.table_name = 'hourly_precip'
end
