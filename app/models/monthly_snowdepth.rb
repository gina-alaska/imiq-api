class MonthlySnowdepth < ActiveRecord::Base
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_snowdepth'
end
