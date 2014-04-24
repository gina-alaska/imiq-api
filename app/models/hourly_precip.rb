class HourlyPrecip < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'hourly_precip'
end
