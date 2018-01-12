class HourlySwe < ApplicationRecord
  include DerivedModelConcerns
  include HourlyModelConcerns   
  
  self.table_name = 'hourly_swe'
end
