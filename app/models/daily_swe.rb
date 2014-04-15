class DailySwe < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'daily_swe'
end
