class DailyRh < ApplicationRecord
  include DerivedModelConcerns
  include DailyModelConcerns
    
  self.table_name = 'daily_rh'
end
