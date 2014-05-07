class DailyWinddirection < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns  
 
  belongs_to :unit, foreign_key: 'variableunitsid'
  
  self.table_name = 'daily_winddirection'
end
