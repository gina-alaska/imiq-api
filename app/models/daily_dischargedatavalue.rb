class DailyDischargedatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Discharge"
  
  def self.csv_header
    pretty_name + " (m3/sec)"
  end
  
end
