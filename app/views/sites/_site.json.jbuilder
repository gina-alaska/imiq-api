json.cache! ['v9', site, params[:verbose]] do
  json.url site_url(site, :json)
  json.(site, *Site.column_names.map(&:to_sym))
  json.begin_date site.begin_date
  json.end_date site.end_date
  json.derived_variables site.derived_variables.values.flatten.uniq.map(&:humanize)

  if params[:verbose]
	  json.source site.source
	  json.variables site.variables.map(&:variablename)
	  json.datastreams site.datastreams.map(&:datastreamname)
  end
end
