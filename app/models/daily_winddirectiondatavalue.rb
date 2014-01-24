class DailyWinddirectiondatavalue < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
  scope :has_data, Proc.new{where "datavalue is not null"}
  
  include PrettyName
  PRETTY_NAME = "Daily Wind Direction"
  
  def self.csv_header
    "Wind Direction (deg)"
  end
  
end
