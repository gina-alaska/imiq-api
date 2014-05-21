class DailySwe < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns  
  
  self.table_name = 'daily_swe'
end
