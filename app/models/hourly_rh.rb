class HourlyRh < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'hourly_rh'
end
