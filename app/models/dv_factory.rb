class DVFactory
  TIMESTEPS = %w{ daily hourly monthly source }

  class << self
    def daily(name=nil)
      if name.nil?
        self.find_models(:daily)
      else
        DerivedModel.new(:daily, name)
      end
    end

    def hourly(name=nil)
      if name.nil?
        self.find_models(:hourly)
      else
        DerivedModel.new(:hourly, name)
      end
    end

    def monthly(name=nil)
      if name.nil?
        self.find_models(:monthly)
      else
        DerivedModel.new(:monthly, name)
      end
    end
    
    def source(name=nil)
      if name.nil?
        [
          ['Barometric Pressure', 'source_air_barometric_pressure', { variablename: 'Barometric pressure', samplemedium: 'Air' }],
          ['Clouds', 'source_air_clouds', { variablename: ['Ceiling height','Sky cover'], samplemedium: 'Air' }],
          ['Humidity', 'source_air_humidity', { variablename: ['Relative humidity','Vapor pressure'], samplemedium: 'Air'}],
          ['Radiation, Longwave/Shortwave', 'source_air_radiation_lwsw', { variablename: ['Radiation, incoming longwave','Radiation, outgoing longwave','Radiation, global','Radiation, incoming shortwave','Radiation, outgoing shortwave','Radiation, global','Radiation, net','Radiation, net longwave','Radiation, total incoming','Radiation, total outgoing'], samplemedium: 'Air' }],
          ['Radiation, PAR', 'source_radiation_par', { variablename: ['Radiation, PAR', 'Radiation, incoming PAR'] }],
          ['Temperature, Air', 'source_air_temperature', { variablename: ['Temperature'], samplemedium: 'Air' }],
          ['Visibility', 'source_air_visibility', { variablename: ['Visibility'], samplemedium: 'Air' }],
          ['Wind, Direction/Speed', 'source_air_wind', { variablename: ['Wind direction', 'Wind sector', 'Wind speed', 'Wind vector magnitude'], samplemedium: 'Air' }],
          ['Pan Evaporation', 'source_precipitation_pan_evaporation', { variablename: ['Evaporation'], samplemedium: 'Air' }],
          ['Precipitation', 'source_precipitation_precipitation', { variablename: ['Precipitation'], samplemedium: 'Air' }],
          ['Snowfall', 'source_precipitation_snowfall', { variablename: ['Snowfall'], samplemedium: ['Precipitation', 'Snow'] }],
          ['Ablation', 'source_snow_ablation', { variablename: ['Ablation'], samplemedium: 'Snow' }],
          ['Snow Density', 'source_snow_density', { variablename: ['Density'], samplemedium: 'Snow' }],
          ['Snow Depth', 'source_snow_depth', { variablename: 'Snow depth', samplemedium: 'Snow' }],
          ['Snow Temperature', 'source_snow_temperature', { variablename: 'Temperature', samplemedium: 'Snow' }],
          ['Snow Water Equivalent', 'source_snow_swe', { variablename: 'Snow water equivalent', samplemedium: 'Snow' }],
          ['Soil Albedo', 'source_soil_albedo', { variablename: 'Albedo', samplemedium: 'Soil' }],
          ['Frost Free Days', 'source_soil_frost_free_days', { variablename: 'Frost free day', samplemedium: 'Soil' }],
          ['Soil Temperature', 'source_soil_temperature', { variablename: 'Temperature', samplemedium: 'Soil' }],
          ['Thaw Depth', 'source_soil_thaw_depth', { variablename: 'Thaw depth', samplemedium: 'Soil' }],
          ['Soil Water Content', 'source_soil_water_content', { variablename: ['Water content','Volumetric water content'], samplemedium: 'Soil' }],
          ['Water Chemistry', 'source_sw_chemistry', { variablename: ['Carbon, total organic', 'Electrical Conductivity', 'Luminescent, dissolved oxygen', 'Oxygen, dissolved', 'Reduction potential', 'Turbidity', 'pH'], samplemedium: 'Surface Water' }],
          ['Discharge/Runoff', 'source_sw_discharge', { variablename: ['Discharge','Runoff'], samplemedium: 'Surface Water' }],
          ['Fish Detected', 'source_sw_fish_detected', { variablename: 'Fish detected', samplemedium: 'Surface Water' }],
          ['Ice Properties', 'source_sw_ice', { variablename: ['Ice','Ice thickness'] }],
          ['Physical Water Properties', 'source_sw_physical', { variablename: ['Area, Surface', 'Free board', 'Gage height', 'Volume', 'Water depth', 'Water level'], samplemedium: 'Surface Water' }],
          ['Water Pressure', 'source_sw_pressure', { variablename: ['Barometric pressure', 'Water pressure'], samplemedium: 'Surface Water' }],
          ['Surface Water Temperature', 'source_sw_temperature', { variablename: ['Temperature, temperature'], samplemedium: 'Surface Water' }]
        ].collect { |item| SourceModel.new(*item) }
      else
        SourceModel.new(name)
      end
    end
    
    def source_options
      source.collect(&:select_option)
    end

    def slug(name)
      breakdown = name.to_s.split('_')
      if TIMESTEPS.include?(breakdown.first)
        DerivedModel.new(breakdown.shift, breakdown.join('_'))
      else
        SourceModel.new(name)
      end
    end

    def from_class(klass)
      # TODO: Implement a better method for detecting a derivced vs source class
      DerivedModel.from_class(klass)
    end

    def find_models(timestep)
      Dir.glob(Rails.root.join('app/models', "#{timestep}_*.rb")).collect do |file|
        self.slug(File.basename(file, '.rb'))
      end
    end
  end
end
