class DailyPrecip < ActiveRecord::Base
  include DerivedModelConcerns
  
  self.table_name = 'daily_precip'
end
