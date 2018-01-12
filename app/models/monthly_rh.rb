class MonthlyRh < ApplicationRecord
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_rh'
end
