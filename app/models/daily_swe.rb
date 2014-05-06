class DailySwe < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns  
  self.table_name = 'daily_swe'
  
  def self.units
    'millimeters'
  end
end
