# these are all required to handle the data coming from the 
# seriescatalog_62 view instead of the sites table

class Site < ActiveRecord::Base
  module SitesTable
    extend ActiveSupport::Concern
    
    included do
      scope :has_location, Proc.new {
        where("geolocation is not null")
      }
    end
  end
end
