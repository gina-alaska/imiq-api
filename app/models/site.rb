class Site < ActiveRecord::Base
  belongs_to :source, foreign_key: 'sourceid'
end
