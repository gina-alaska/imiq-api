class Datavalue < ApplicationRecord
  belongs_to :datastream, foreign_key: 'datastreamid'
end
