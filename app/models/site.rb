class Site < ActiveRecord::Base
  include GeoRuby::SimpleFeatures
  include SitesTable
  # include SeriesCatalog62View
  
  include Search::Sites
  
  # This is the configuration needed to pull the from the correct view with valid sites
  # currently we are not using it because the geolocation field in being set to a binary
  # datatype that we cannot decode
  
  DERIVED_VARIABLES = {
    'air_temp' => :daily_airtempdatavalues,
    'relative_humidity' => :daily_rhdatavalues,
    'discharge' => :daily_dischargedatavalues,
    'precipitation' => :daily_precipdatavalues,
    'snow_depth' => :daily_snowdepthdatavalues,
    'snow_water_equivalent' => :daily_swedatavalues,
    'wind_direction' => :daily_winddirectiondatavalues,
    'wind_speed' => :daily_windspeeddatavalues
  }
  
  belongs_to :source, foreign_key: 'sourceid'
  has_many :organizations, through: :source
  has_one :metadata, through: :source
  has_many :datastreams, foreign_key: 'siteid'
  has_many :datavalues, through: :datastreams
  has_many :variables, through: :datastreams
  has_many :daily_airtempdatavalues, foreign_key: 'siteid'
  has_many :daily_dischargedatavalues, foreign_key: 'siteid'
  has_many :daily_precipdatavalues, foreign_key: 'siteid'
  has_many :daily_rhdatavalues, foreign_key: 'siteid'
  has_many :daily_snowdepthdatavalues, foreign_key: 'siteid'
  has_many :daily_swedatavalues, foreign_key: 'siteid'
  has_many :daily_winddirectiondatavalues, foreign_key: 'siteid'
  has_many :daily_windspeeddatavalues, foreign_key: 'siteid'
  has_many :hourly_airtempdatavalues, foreign_key: 'siteid'
  has_many :hourly_dischargedatavalues, foreign_key: 'siteid'
  has_many :hourly_precipdatavalues, foreign_key: 'siteid'
  has_many :hourly_rhdatavalues, foreign_key: 'siteid'  
  has_many :hourly_snowdepthdatavalues, foreign_key: 'siteid'
  has_many :hourly_swedatavalues, foreign_key: 'siteid'
  has_many :hourly_winddirectiondatavalues, foreign_key: 'siteid'
  has_many :hourly_windspeeddatavalues, foreign_key: 'siteid'

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
  
  def begin_date
    datastreams.where('startdate is not null').order('startdate ASC').first.try(:startdate)
  end
  
  def end_date
    datastreams.where('startdate is not null').order('enddate DESC').first.try(:enddate)
  end
  
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
    DERIVED_VARIABLES.each do |key,variable|
      # found << variable if self.daily_airtempdatavalues.count > 0
      dv = self.send(variable) if self.respond_to?(variable)
      if dv.count > 0
        found << key 
      end
    end
    
    found
  end  
  
  def geometry
    if geolocation.nil?
      nil
    else
      @geometry ||= Geometry.from_ewkt(geolocation) 
    end
  end
  
  def envelope
    @envelope ||= geometry.try(:envelope)
  end
  
  def wkt
    geometry
  end
  
  # we can't assume these will always be points
  # so get bounds and find the center point
  def lat
    envelope.try(:center).try(:lat)
  end
  
  # we can't assume these will always be points
  # so get bounds and find the center point
  def lng
    envelope.try(:center).try(:lng)
  end
  
  def z
    geometry.try(:envelope).try(:center).try(:z)
  end
  
  def cache_key
    "site/#{siteid}/v1"
  end
end
