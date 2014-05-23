class DVFactory
  TIMESTEPS = %w{ daily hourly source }

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

    def source(name=nil)
      if name.nil?
        [
          SourceModel.new('Ablation'),
          SourceModel.new('Dissolved oxygen', 'source_dissolved_oxygen', ['Luminescent dissolved oxygen', 'Oxygen, dissolved'])
        ]
      else
        SourceModel.new(name)
      end
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
