class DailyRh < ActiveRecord::Base
  include DerivedModelConcerns
  include DailyModelConcerns
    
  self.table_name = 'daily_rh'
end
