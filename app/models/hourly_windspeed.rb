class HourlyWindspeed < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'hourly_windspeed'
end
