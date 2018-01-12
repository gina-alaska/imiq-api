class HourlyWinddirection < ApplicationRecord
  include DerivedModelConcerns
  include HourlyModelConcerns   
  
  self.table_name = 'hourly_winddirection'
end
