class HourlySwe < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'hourly_swe'
end
