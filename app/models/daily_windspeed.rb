class DailyWindspeed < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns 
  self.table_name = 'daily_windspeed'
  
  def self.units
    'meters per second'
  end
end
