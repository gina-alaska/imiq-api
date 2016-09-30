class FifteenminWatertemp < ActiveRecord::Base
  include DerivedModelConcerns
  include FifteenminModelConcerns
  
  self.table_name = 'fifteenmin_watertemp'
end
