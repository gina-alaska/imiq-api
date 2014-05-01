class DailyWatertemp < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns  
  self.table_name = 'daily_watertemp'
  
  def self.units
    'degrees celsius'
  end
end
