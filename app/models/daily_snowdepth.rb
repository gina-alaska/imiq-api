class DailySnowdepth < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns
    
  self.table_name = 'daily_snowdepth'
end
