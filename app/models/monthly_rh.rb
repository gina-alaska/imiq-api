class MonthlyRh < ActiveRecord::Base
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_rh'
end
