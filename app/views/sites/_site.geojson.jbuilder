json.cache! ['v9', site, params[:verbose]] do
  json.type 'Feature'
  json.geometry site.wkt
  json.properties do
    json.url site_url(site, :json)
    json.(site, *Site.column_names.map(&:to_sym))
    json.begin_date site.begin_date
    json.end_date site.end_date
    json.source site.source
  	json.datastreams site.datastreams.map(&:datastreamname)
  	json.networks site.networks.map(&:networkcode).uniq    
    json.derived_variables site.derived_variables.values.flatten.uniq.collect(&:humanize)
    if params[:verbose]
      json.variables site.variables.map(&:variablename).uniq
      # json.derived_variables site.derived_variables
    end
  end
end
