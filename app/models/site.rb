class Site < ActiveRecord::Base
  include GeoRuby::SimpleFeatures
  include SitesTable
  # include SeriesCatalog62View
  
  # This is the configuration needed to pull the from the correct view with valid sites
  # currently we are not using it because the geolocation field in being set to a binary
  # datatype that we cannot decode
  
  belongs_to :source, foreign_key: 'sourceid'
  has_many :organizations, through: :source
  has_one :metadata, through: :source
  has_many :datastreams, foreign_key: 'siteid'
  has_many :variables, through: :datastreams
  has_many :daily_airtempdatavalues, foreign_key: 'siteid'
  
  scope :geomtype, Proc.new { |geomtype|
    where('spatialcharacteristics ilike ?', "#{geomtype}")
  }

  # Override the default as_json method to set our default values
  # def as_json(opts = {})
  #   opts ||= {}
  #   # opts[:include] ||= []
  #   # opts[:include] << :source
  #   # opts[:only] ||= []
  #   # opts[:only] += [:siteid]
  #   # opts[:except] ||= []
  #   # opts[:except] << :sourceid
  #   
  #   super(opts)
  # end
  
  def support_data_sources
    { daily_airtempdatavalue: 'Daily Air Temp' }
  end
    
  def as_geojson
    {
      type: 'Feature',
      geometry: Geometry.from_ewkt(geolocation).as_json,
      properties: as_json
    }
  end  
  
  def cache_key
    "site/#{siteid}/v1"
  end
end
