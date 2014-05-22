# encoding: utf-8
module DerivedModelConcerns
  extend ActiveSupport::Concern

  included do
    belongs_to :site, foreign_key: 'siteid'
    belongs_to :variable, foreign_key: 'variableid'
    has_one :unit, through: :variable
    
    has_one :source, through: :site
    has_many :datastreams, :through => :site

    scope :has_data, ->{ where "datavalue is not null" }
    scope :startdate, -> datetime { where "utcdatetime >= ?", datetime }
    scope :enddate, -> datetime { where "utcdatetime <= ?", datetime }

    def datastream
      self.datastreams.where(siteid: self.siteid).first
    end
  end
end
