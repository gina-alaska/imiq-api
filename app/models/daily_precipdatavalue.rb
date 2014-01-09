class DailyPrecipdatavalue < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
end
