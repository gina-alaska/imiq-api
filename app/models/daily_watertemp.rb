class DailyWatertemp < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns  
  
  self.table_name = 'daily_watertemp' 
end
