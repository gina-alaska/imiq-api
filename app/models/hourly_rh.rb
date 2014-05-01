class HourlyRh < ActiveRecord::Base
  include DerivedModelConcerns
  include HourlyModelConcerns 
  self.table_name = 'hourly_rh'
  
  def self.units
    'percent'
  end
end
