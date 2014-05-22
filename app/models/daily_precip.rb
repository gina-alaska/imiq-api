class DailyPrecip < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns
  
  self.table_name = 'daily_precip'
end
