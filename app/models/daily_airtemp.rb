class DailyAirtemp < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns 

  self.table_name = 'daily_airtemp'
  
  def self.units
    'degrees celsius'
  end
end
