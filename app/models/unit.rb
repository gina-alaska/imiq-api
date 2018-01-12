class Unit < ApplicationRecord
  has_many :variables, foreign_key: 'variableunitsid'
end
