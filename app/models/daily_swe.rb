class DailySwe < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns  
  
  self.table_name = 'daily_swe'
end
