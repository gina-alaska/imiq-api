class DailyWinddirection < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'daily_winddirection'
end
