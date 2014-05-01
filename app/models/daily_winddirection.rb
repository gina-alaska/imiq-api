class DailyWinddirection < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns  
  self.table_name = 'daily_winddirection'
  
  def self.units
    'degrees'
  end
end
