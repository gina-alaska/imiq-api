class DailyPrecipdatavalue < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
  scope :has_data, Proc.new{where "datavalue is not null"}
  
  def self.csv_header
    "Precipitation (inches)"
  end
  
end
