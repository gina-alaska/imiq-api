class SourceModel
  attr_reader :pretty_name, :slug, :query, :variablename
  
  def initialize(pretty_name, slug = nil, query = nil)
    @pretty_name = pretty_name
    if slug.nil?
      @slug = "source_#{pretty_name.underscore}"
      @variablename = pretty_name.underscore
    else
      @slug = slug
      @variablename = slug.gsub(/^source_/, '')
    end
    if query.nil?
      @query = { variablename: pretty_name }
    else
      @query = query
    end
  end
  
  def select_option
    [@pretty_name, @variablename]
  end
end
