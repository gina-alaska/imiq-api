class DailyRh < ActiveRecord::Base
  include DerivedModelConcerns
  self.table_name = 'daily_rh'
end
