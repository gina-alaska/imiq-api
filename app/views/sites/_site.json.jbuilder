json.cache! ['v2', site] do
  json.url site_url(site, :json)
  json.(site, *Site.column_names.map(&:to_sym))
  json.source site.source  
  json.variables site.variables.map(&:variablename)
  json.datastreams site.datastreams.map(&:datastreamname)
  json.daily_airtempdatavalues site.daily_airtempdatavalues.map(&:datavalue).first
end