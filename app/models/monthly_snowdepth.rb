class MonthlySnowdepth < ApplicationRecord
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_snowdepthavg'
end
