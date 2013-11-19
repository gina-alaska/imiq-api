class Source < ActiveRecord::Base
  has_many :sites, foreign_key: 'sourceid'
end
