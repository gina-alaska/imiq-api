class Site < ActiveRecord::Base
  belongs_to :source, foreign_key: 'sourceid'
  has_one :metadata, through: :source
  
  include GeoRuby::SimpleFeatures

  scope :has_location, -> {
    where('geolocation is not null')
  }
  scope :geomtype, -> (geomtype)  {
    where('geolocation ilike ?', "#{geomtype}%")
  }

  # Override the default as_json method to set our default values
  def as_json(opts = nil)
    opts ||= {}
    opts[:include] ||= []
    opts[:include] << :source
    
    opts[:except] ||= []
    opts[:except] << :sourceid
    
    super(opts)
  end
  
  def as_geojson
    {
      type: 'Feature',
      geometry: Geometry.from_ewkt(geolocation).as_json,
      properties: as_json
    }
  end  
end
