class DailySnowdepth < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns
    
  self.table_name = 'daily_snowdepth'
end
