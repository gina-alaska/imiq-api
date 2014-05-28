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
  has_many :daily_airtemps, foreign_key: 'siteid'
  has_many :daily_discharges, foreign_key: 'siteid'
  has_many :daily_precips, foreign_key: 'siteid'
  has_many :daily_rhs, foreign_key: 'siteid'
  has_many :daily_snowdepths, foreign_key: 'siteid'
  has_many :daily_swes, foreign_key: 'siteid'
  has_many :daily_winddirections, foreign_key: 'siteid'
  has_many :daily_windspeeds, foreign_key: 'siteid'
  has_many :daily_watertemps, foreign_key: 'siteid'
  has_many :hourly_airtemps, foreign_key: 'siteid'
  has_many :hourly_discharges, foreign_key: 'siteid'
  has_many :hourly_precips, foreign_key: 'siteid'
  has_many :hourly_rhs, foreign_key: 'siteid'
  has_many :hourly_snowdepths, foreign_key: 'siteid'
  has_many :hourly_swes, foreign_key: 'siteid'
  has_many :hourly_winddirections, foreign_key: 'siteid'
  has_many :hourly_windspeeds, foreign_key: 'siteid'

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
  
  def has_data_for(model)
    case model.slug.split('_').first
    when 'source'
      self.variables.where(variablename: model.variablenames).count > 0
    else
      self.respond_to?(model.slug.pluralize) and self.send(model.slug.pluralize).size > 0
    end
  end
  
  def derived_variables
    if @derived_variables.nil?
      @derived_variables = {}
      DVFactory::TIMESTEPS.each do |timestep|
        DVFactory.send(timestep).each do |model|
          @derived_variables[timestep] ||= []
          @derived_variables[timestep] << [model.pretty_name, model.slug] if has_data_for(model)
          #if self.respond_to?(model.slug.pluralize) and self.send(model.slug.pluralize).size > 0
        end
      end
    end
    @derived_variables
  end

  def available_variables
    dvariables = []

    DVFactory::TIMESTEPS.each do |timestep|
      dvariables += variables_for(timestep) { |v| v.gsub("#{timestep}_", '') }
    end

    dvariables.flatten.uniq
  end

  def available_timestep_variables
    dvariables = []

    DVFactory::TIMESTEPS.each do |timestep|
      dvariables += variables_for(timestep)
    end

    dvariables.flatten.uniq
  end

  def variables_for(timestep, &block)
    derived_variables[timestep].collect do |v| 
      a = v[1] 
      if block_given?
        a = yield a
      end
      
      a
    end
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

  def as_point
    case geometry.try(:text_geometry_type)
    when 'POINT'
      geometry
    else
      envelope.try(:center)
    end
  end

  def wkt
    geometry
  end

  # we can't assume these will always be points
  # so get bounds and find the center point
  def lat
    as_point.try(:lat)
  end

  # we can't assume these will always be points
  # so get bounds and find the center point
  def lng
    as_point.try(:lng)
  end

  def z
    if as_point.try(:with_z)
      as_point.try(:z)
    else
      nil
    end
  end

  def cache_key
    "site/#{siteid}/v1"
  end
end
