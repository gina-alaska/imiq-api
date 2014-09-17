class MonthlySwe < ActiveRecord::Base
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_swe'
end
