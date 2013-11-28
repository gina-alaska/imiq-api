class Datastream < ActiveRecord::Base
  belongs_to :site, foreign_key: 'siteid'
  belongs_to :variable, foreign_key: 'variableid'
end
