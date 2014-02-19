class DailyPrecipdatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Precipitation"
  
  def self.csv_header
    pretty_name + " (mm)"
  end
  
end
