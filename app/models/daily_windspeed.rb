class DailyWindspeed < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'daily_windspeed'
end
