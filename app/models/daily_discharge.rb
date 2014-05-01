class DailyDischarge < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns
  self.table_name = 'daily_discharge'
  
  def self.units
    'centimers per second'
  end
end
