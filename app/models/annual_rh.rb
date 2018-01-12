class AnnualRh < ApplicationRecord
  include DerivedModelConcerns
  include AnnualModelConcerns

  self.table_name = 'annual_avgrh'
end
