class DailyRh < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns
  self.table_name = 'daily_rh'
  
  def self.units
    'percent'
  end
end
