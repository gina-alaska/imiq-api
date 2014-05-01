class DailyPrecip < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns
  self.table_name = 'daily_precip'
  
  def self.units
    'millimeters'
  end
end
