class Datavalue < ActiveRecord::Base
  belongs_to :datastream, foreign_key: 'datastreamid'
end
