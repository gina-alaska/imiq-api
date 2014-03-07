class DailySnowdepthdatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Snow Depth"
  
  def self.csv_header
    pretty_name + " (m)"
  end
  
end

