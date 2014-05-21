class DailyWatertemp < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns  
  
  self.table_name = 'daily_watertemp' 
end
