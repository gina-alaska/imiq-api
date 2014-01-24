class DailySnowdepthdatavalue < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
  scope :has_data, Proc.new{where "datavalue is not null"}
  
  include PrettyName
  PRETTY_NAME = "Daily Snow Depth"
  
  def self.csv_header
    "Snow Depth (m)"
  end
  
end

