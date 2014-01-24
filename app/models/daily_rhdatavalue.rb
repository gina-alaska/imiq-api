class DailyRhdatavalue < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
  scope :has_data, Proc.new{where "datavalue is not null"}
  
  include PrettyName
  PRETTY_NAME = "Daily Relative Humidity"
  
  def self.csv_header
    "Relative Humidity (%)"
  end
end
