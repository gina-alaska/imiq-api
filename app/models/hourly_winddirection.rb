class HourlyWinddirection < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'hourly_winddirection'
end
