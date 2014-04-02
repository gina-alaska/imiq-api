class DailyWatertempdatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Water Temperature"
  
  def self.csv_header
    pretty_name + " (C)"
  end
end
