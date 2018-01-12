class HourlyRh < ApplicationRecord
  include DerivedModelConcerns
  include HourlyModelConcerns 
  
  self.table_name = 'hourly_rh'
end
