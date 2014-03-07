class DailyWinddirectiondatavalue < ActiveRecord::Base
  include DerivedValue  
  include PrettyName
  PRETTY_NAME = "Daily Wind Direction"
  
  def self.csv_header
    pretty_name + " (deg)"
  end
  
end
