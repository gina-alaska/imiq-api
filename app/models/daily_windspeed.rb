class DailyWindspeed < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns 
  
  self.table_name = 'daily_windspeed'
end
