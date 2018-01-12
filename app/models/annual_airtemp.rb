class AnnualAirtemp < ApplicationRecord
  include DerivedModelConcerns
  include AnnualModelConcerns

  self.table_name = 'annual_avgairtemp'
end
