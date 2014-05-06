class HourlyWinddirection < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns   
  self.table_name = 'hourly_winddirection'
  
  def self.units
    'degrees'
  end
end
