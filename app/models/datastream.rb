class Datastream < ApplicationRecord
  belongs_to :site, foreign_key: 'siteid'
  belongs_to :variable, foreign_key: 'variableid'
  has_many :datavalues, foreign_key: 'datastreamid'
end
