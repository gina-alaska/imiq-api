class DailyAirtemp < ActiveRecord::Base
  include DerivedModelConcerns

  self.table_name = 'daily_airtemp'
end
