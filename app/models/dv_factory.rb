class DVFactory
  class << self
    def daily(name)
      DerivedModel.new(:daily, name)
    end

    def hourly(name)
      DerivedModel.new(:hourly, name)
    end

    def source(name)
      SourceModel.new(name)
    end

    def from_class(klass)
      # TODO: Implement a better method for detecting a derivced vs source class
      DerivedModel.from_class(klass)
    end
  end
end
