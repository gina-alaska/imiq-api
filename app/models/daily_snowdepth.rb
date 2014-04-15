class DailySnowdepth < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'daily_snowdepth'
end
