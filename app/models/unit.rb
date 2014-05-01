class Unit < ActiveRecord::Base
  has_many :variables, foreign_key: 'variableunitsid'
end
