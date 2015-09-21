class AnnualRh < ActiveRecord::Base
  include DerivedModelConcerns
  include AnnualModelConcerns

  self.table_name = 'annual_avgrh'
end
