class AnnualDischarge < ActiveRecord::Base
  include DerivedModelConcerns
  include AnnualModelConcerns

  self.table_name = 'annual_avgdischarge'
end
