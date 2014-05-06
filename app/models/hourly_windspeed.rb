class HourlyWindspeed < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns   
  self.table_name = 'hourly_windspeed'
  
  def self.units
    'meters per second'
  end
end
