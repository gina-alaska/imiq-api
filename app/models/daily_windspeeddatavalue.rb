class DailyWindspeeddatavalue < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
  scope :has_data, Proc.new{where "datavalue is not null"}
  
  def self.csv_header
    "Wind Speed (m/s)"
  end
  
end
