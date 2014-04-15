class HourlySnowdepth < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'hourly_snowdepth'
end
