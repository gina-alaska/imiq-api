class DailySwedatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Snow Water Equivalent"
  
  def self.csv_header
    pretty_name + " (mm)"
  end
  
end
