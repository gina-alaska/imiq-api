class MonthlyPrecip < ActiveRecord::Base
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_precip'
end
