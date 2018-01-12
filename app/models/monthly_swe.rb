class MonthlySwe < ApplicationRecord
  include DerivedModelConcerns
  include MonthlyModelConcerns 
  
  self.table_name = 'monthly_sweavg'
end
