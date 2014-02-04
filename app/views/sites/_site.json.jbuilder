json.cache! ['v4', site, params[:verbose]] do
  json.url site_url(site, :json)
  json.(site, *Site.column_names.map(&:to_sym))
  if params[:verbose]
	  json.source site.source  
	  json.variables site.variables.map(&:variablename)
	  json.datastreams site.datastreams.map(&:datastreamname)
	  json.derived_variables site.derived_variables
  end
end