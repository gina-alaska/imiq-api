class DailyWindspeed < ActiveRecord::Base
  include DerivedModelConcerns
  
  self.table_name = 'daily_windspeed'
  
  def self.units
    'meters per second'
  end
end
