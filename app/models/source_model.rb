class SourceModel
  attr_reader :pretty_name, :slug, :variablenames
  
  def initialize(pretty_name, slug = nil, variablenames = nil)
    @pretty_name = pretty_name
    if slug.nil?
      @slug = "source_#{pretty_name.underscore}"
    else
      @slug = slug
    end
    if variablenames.nil?
      @variablenames = [pretty_name]
    else
      @variablenames = variablenames
    end
  end
end
