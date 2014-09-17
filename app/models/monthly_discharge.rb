class MonthlyDischarge < ActiveRecord::Base
  include DerivedModelConcerns
  include MonthlyModelConcerns
  
  self.table_name = 'monthly_discharge'
end
