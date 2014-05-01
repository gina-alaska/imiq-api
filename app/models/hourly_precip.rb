class HourlyPrecip < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns 
  self.table_name = 'hourly_precip'
  
  def self.units
    'millimeters'
  end
end
