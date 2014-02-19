class DailyAirtempdatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Air Temperature"
  
  def self.csv_header
    pretty_name + " (C)"
  end
end
