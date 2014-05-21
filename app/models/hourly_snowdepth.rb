class HourlySnowdepth < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns   
  
  self.table_name = 'hourly_snowdepth'
end
