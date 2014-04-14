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
  end
end
