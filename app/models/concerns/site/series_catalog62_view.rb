# these are all required to handle the data coming from the 
# seriescatalog_62 view instead of the sites table

class Site < ActiveRecord::Base
  module SeriesCatalog62View
    extend ActiveSupport::Concern
    
    included do
      self.table_name = 'seriescatalog_62'
      self.primary_key = 'siteid'
      
      scope :has_location, Proc.new {
        where("geolocationtext is not null")
      }
    end

    def geolocation
      self.read_attribute(:geolocationtext)
    end
    
    #Override the default as_json method to set our default values
    def as_json(opts = {})
      opts ||= {}
      # opts[:include] ||= []
      # opts[:include] << :source
      opts[:only] ||= []
      opts[:only] += [
        :siteid, :sitecode, :sitename, :comments, :sourceid, :localprojectionid, :posaccuracy_m, 
        :state, :county, :latlongdatumid, :locationdescription, :geolocation, :datastreamname
      ]
      
      # opts[:methods] ||= []
      # opts[:methods] << :geolocation
      
      # opts[:except] ||= []
      # opts[:except] << :sourceid
      
      super(opts)
    end
  end
end