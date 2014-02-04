class DailyDischargedatavalue < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
  scope :has_data, Proc.new{where "datavalue is not null"}
  
  include PrettyName
  PRETTY_NAME = "Daily Discharge"
  
  def self.csv_header
    pretty_name + " (cfs)"
  end
  
end