class DailyDischarge < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns
  
  self.table_name = 'daily_discharge'
end
