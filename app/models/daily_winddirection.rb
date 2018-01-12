class DailyWinddirection < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns  
 
  self.table_name = 'daily_winddirection'
end
