class DailyRhdatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Relative Humidity"
  
  def self.csv_header
    pretty_name + " (%)"
  end
end
