class DerivedModel
  # order is important here!!!
  ALIASES = [
    ['datavalue', ''],
    ['temp', 'temperature'],
    ['precip', 'precipitation'],
    ['rh', 'relative humidity'],
    ['snow', 'snow '],
    ['wind', 'wind '],
    ['water', 'water '],
    ['air', 'air '],
    ['swe', 'snow water equivalent']
  ]

  class << self
    def exists?(timestep, name)
      File.exists?(Rails.root.join("app/models/#{basename(timestep, name)}.rb"))
    end

    def model(timestep, name)
      if exists?(:daily, name)
        basename(timestep, name).classify.constantize
      end
    end

    def basename(timestep, name)
      "#{timestep}_#{name}"
    end

    def from_class(klass)
      break_down = class_filename(klass).split('_')
      timestep = break_down.shift
      name = break_down.join('_')

      self.new(timestep, name)
    end

    def class_filename(klass)
      klass.name.underscore
    end
  end

  def initialize(timestep, name)
    @klass = self.class.model(timestep, name)
  end

  def pretty_name
    return '' if @klass.nil?

    name = @klass.name.underscore.humanize
    ALIASES.each do |substitution|
      name.gsub!(*substitution)
    end

    name
  end

  def model
    @klass
  end
end
