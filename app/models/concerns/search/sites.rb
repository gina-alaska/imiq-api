module Search
  module Sites
    extend ActiveSupport::Concern

    included do
      searchable do
        integer :siteid

        #full-text search indexes
        text :siteid
        text :sitename
        text :variablenames_text do
          variablenames_index
        end
        text :networkcodes_text do
          networkcodes_index
        end
        text :organizationcodes_text do
          organizationcodes_index
        end
        text :generalcategories do
          generalcategories_index
        end
        text :source do
          [source.organization, source.contactname]
        end

        string :sitename
        string :variablenames, :multiple => true do
          variablenames_index
        end
        string :networkcodes, :multiple => true do
          networkcodes_index
        end
        string :organizationcodes, :multiple => true do
          organizationcodes_index
        end
        string :generalcategories, :multiple => true do
          generalcategories_index
        end
        string :derived_variables, multiple: true do
          available_variables
        end

        string :timesteps, multiple: true do
           derived_variables.keys.reject do |key|
             derived_variables[key].count == 0
           end
        end

        string :timestep_variables, multiple: true do
          available_timestep_variables
        end

        string :geomtype do
          spatialcharacteristics.upcase
        end
        boolean :has_data do
          # derived_variables.values.flatten.compact.count > 0
          datastreams.count > 0
        end
        boolean :has_location do
          !geolocation.nil?
        end
        latlon :location do
          Sunspot::Util::Coordinates.new(lat, lng)
        end
      end
    end

    def variablenames_index
      @variablenames_index ||= variables.map(&:variablename)
    end

    def networkcodes_index
      @networkcodes_index ||= networks.map(&:networkcode)
    end

    def organizationcodes_index
      @organizationcodes_index ||= organizations.map(&:organizationcode)
    end

    def generalcategories_index
      @generalcategories_index ||= variables.map(&:generalcategory)
    end
  end
end
