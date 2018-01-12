class MonthlyAirtemp < ApplicationRecord
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_airtemp'
end
