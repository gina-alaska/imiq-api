class Site < ActiveRecord::Base
  include GeoRuby::SimpleFeatures
  include SitesTable
  # include SeriesCatalog62View

  include Search::Sites

  # This is the configuration needed to pull the from the correct view with valid sites
  # currently we are not using it because the geolocation field in being set to a binary
  # datatype that we cannot decode

  DAILY_DERIVED_VARIABLES = {
    'air_temp' => :daily_airtempdatavalues,
    'relative_humidity' => :daily_rhdatavalues,
    'discharge' => :daily_dischargedatavalues,
    'precipitation' => :daily_precipdatavalues,
    'snow_depth' => :daily_snowdepthdatavalues,
    'snow_water_equivalent' => :daily_swedatavalues,
    'wind_direction' => :daily_winddirectiondatavalues,
    'wind_speed' => :daily_windspeeddatavalues,
    'water_temp' => :daily_watertempdatavalues,
  }

  HOURLY_DERIVED_VARIABLES = {
    'air_temp' =>               :hourly_airtempdatavalues,
    'relative_humidity' =>      :hourly_rhdatavalues,
    'precipitation' =>          :hourly_precipdatavalues,
    'snow_depth' =>             :hourly_snowdepthdatavalues,
    'snow_water_equivalent' =>  :hourly_swedatavalues,
    'wind_direction' =>         :hourly_winddirectiondatavalues,
    'wind_speed' =>             :hourly_windspeeddatavalues
  }

  DERIVED_VARIABLES = {
    'daily' => DAILY_DERIVED_VARIABLES,
    'hourly' => HOURLY_DERIVED_VARIABLES
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
  has_many :daily_watertempdatavalues, foreign_key: 'siteid'  
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
    datastreams.where('bdate is not null').order('bdate ASC').first.try(:bdate)
  end

  def end_date
    datastreams.where('edate is not null').order('edate DESC').first.try(:edate)
  end

  def as_geojson
    {
      type: 'Feature',
      geometry: Geometry.from_ewkt(geolocation).as_json,
      properties: as_json
    }
  end

=begin
@derived_variables = {
  'daily' => [...],
  'hourly' => [...]
}
=end
  def derived_variables
    if @derived_variables.nil?
      @derived_variables = {}
      DERIVED_VARIABLES.each do |timestep, vars|
        vars.each do |name,relation|
          @derived_variables[timestep] ||= []
          @derived_variables[timestep] << name if self.respond_to?(relation) and self.send(relation).size > 0
        end
      end

    end
    @derived_variables
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
