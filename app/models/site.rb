class Site < ActiveRecord::Base
  include GeoRuby::SimpleFeatures
  include SitesTable
  # include SeriesCatalog62View

  include Search::Sites

  belongs_to :source, foreign_key: 'sourceid'
  has_many :networks, through: :source, uniq: true
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
      DVFactory::TIMESTEPS.each do |timestep|
        DVFactory.send(timestep).each do |model|
          @derived_variables[timestep] ||= []
          @derived_variables[timestep] << [model.pretty_name, model.slug] if self.respond_to?(model.slug.pluralize) and self.send(model.slug.pluralize).size > 0
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
