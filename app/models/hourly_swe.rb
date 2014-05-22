class HourlySwe < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns   
  
  self.table_name = 'hourly_swe'
end
