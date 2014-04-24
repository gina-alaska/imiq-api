class DailyDischarge < ActiveRecord::Base
  include DerivedModelConcerns

  self.table_name = 'daily_discharge'
end
