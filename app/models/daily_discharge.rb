class DailyDischarge < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns
  
  self.table_name = 'daily_discharge'
end
