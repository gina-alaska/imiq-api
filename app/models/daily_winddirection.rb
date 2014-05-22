class DailyWinddirection < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns  
 
  self.table_name = 'daily_winddirection'
end
