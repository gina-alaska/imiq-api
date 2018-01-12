class DailyAirtemp < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns 
  self.table_name = 'daily_airtemp'
end
