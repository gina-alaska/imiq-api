class HourlyPrecip < ApplicationRecord
  include DerivedModelConcerns
  include HourlyModelConcerns 
  
  self.table_name = 'hourly_precip'
end
