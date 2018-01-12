class Variable < ApplicationRecord
  include Search::Variables
  
  has_many :datastreams, foreign_key: 'variableid'
  has_many :sites, through: :datastreams
  belongs_to :unit, foreign_key: 'variableunitsid'
  
  def self.names
    unique_values_for(:variablename)
  end
  
  def self.datatypes
    unique_values_for(:datatype)
  end
  
  def self.samplemediums
    unique_values_for(:samplemedium)
  end
  
  def self.valuetypes
    unique_values_for(:valuetype)
  end
  
  def self.generalcategories
    unique_values_for(:generalcategory)
  end
  
  def self.unique_values_for(field)
    variables = Variable.order(field).select(:variableid, field).includes(:sites)
    variables = variables.reject { |v| v.sites.empty? }
    
    variables.collect { |row|
      row.send(field).downcase.strip
    }.uniq
  end
end
