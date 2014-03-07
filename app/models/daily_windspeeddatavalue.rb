class DailyWindspeeddatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Wind Speed"
  
  def self.csv_header
    pretty_name + " (m/s)"
  end
  
end
