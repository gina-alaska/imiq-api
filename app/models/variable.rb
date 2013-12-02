class Variable < ActiveRecord::Base
  has_many :datastreams, foreign_key: 'variableid'
  has_many :sites, through: :datastreams
  
  def self.names
    unique_values_for(:variablename)
  end
  
  def self.datatypes
    unique_values_for(:datatype)
  end
  
  def self.samplemediums
    unique_values_for(:samplemedium)
  end
  
  def self.unique_values_for(field)
    variables = Variable.order(field).select(:variableid, field).includes(:sites)
    variables = variables.reject { |v| v.sites.empty? }
    
    variables.collect { |row|
      row.send(field).downcase.strip
    }.uniq
  end
end
