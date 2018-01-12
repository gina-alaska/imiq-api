class FifteenminWatertemp < ApplicationRecord
  include DerivedModelConcerns
  include FifteenminModelConcerns
  
  self.table_name = 'fifteenmin_watertemp'
end
