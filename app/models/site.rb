class Site < ActiveRecord::Base
  include GeoRuby::SimpleFeatures
  include SitesTable
  # include SeriesCatalog62View
  
  # This is the configuration needed to pull the from the correct view with valid sites
  # currently we are not using it because the geolocation field in being set to a binary
  # datatype that we cannot decode
  
  DERIVED_VARIABLES = {
    'Daily Air Temperature' => :daily_airtempdatavalues,
    'Daily Discharge' => :daily_dischargedatavalues,
    'Daily Precipitation' => :daily_precipdatavalues,
    'Daily Relative Humidity' => :daily_rhdatavalues,
    'Daily Snow Depth' => :daily_snowdepthdatavalues,
    'Daily Snow Water Equivalent' => :daily_swedatavalues,
    'Daily Wind Direction' => :daily_winddirectiondatavalues,
    'Daily Wind Speed' => :daily_windspeeddatavalues,
    'Daily Snow Depth' => :daily_airsnowdepthdatavalues
  }
  
  belongs_to :source, foreign_key: 'sourceid'
  has_many :organizations, through: :source
  has_one :metadata, through: :source
  has_many :datastreams, foreign_key: 'siteid'
  has_many :variables, through: :datastreams
  has_many :daily_airtempdatavalues, foreign_key: 'siteid'
  has_many :daily_dischargedatavalues, foreign_key: 'siteid'
  has_many :daily_precipdatavalues, foreign_key: 'siteid'
  has_many :daily_rhdatavalues, foreign_key: 'siteid'
  has_many :daily_snowdepthdatavalues, foreign_key: 'siteid'
  has_many :daily_swedatavalues, foreign_key: 'siteid'
  has_many :daily_winddirectiondatavalues, foreign_key: 'siteid'
  has_many :daily_windspeeddatavalues, foreign_key: 'siteid'
  
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
  
  def derived_variables
    found = []
    DERIVED_VARIABLES.keys.each do |variable|
      # found << variable if self.daily_airtempdatavalues.count > 0
      found << variable if self.respond_to?(variable) and !self.send(variable).first.nil?  
    end
    
    found
  end  
  
  def wkt
    Geometry.from_ewkt(geolocation)
  end
  
  def cache_key
    "site/#{siteid}/v1"
  end
end
