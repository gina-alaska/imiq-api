class DailyWatertemp < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'daily_watertemp'
end
