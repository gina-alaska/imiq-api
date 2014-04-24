class HourlyAirtemp < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'hourly_airtemp'
end
