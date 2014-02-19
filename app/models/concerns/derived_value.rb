module DerivedValue
  extend ActiveSupport::Concern
  
  included do
    belongs_to :site, foreign_key: 'siteid'
    belongs_to :variable, foreign_key: 'originalvariableid'
    has_one :source, through: :site
    has_many :datastreams, through: :variable
  
    scope :has_data, Proc.new{where "datavalue is not null"}
  end
end