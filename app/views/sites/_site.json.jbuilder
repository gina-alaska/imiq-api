json.cache! ['v25', site, site.source, params[:verbose]] do
  json.url site_url(site, :json)
  json.(site, *Site.column_names.map(&:to_sym))
  json.lat site.lat
  json.lng site.lng
  json.elevation site.z
  json.begin_date site.begin_date
  json.end_date site.end_date
  json.begin_date site.begin_date
  json.end_date site.end_date
  json.source site.source
  json.datastreams site.datastreams.map(&:datastreamname)
  json.networks site.networks.map(&:networkcode)
  json.derived_variables site.derived_variables
  json.variables site.variables.map(&:variablename).uniq
end
