json.cache! ['v2', site] do
  json.type 'Feature'
  json.geometry site.wkt
  json.properties do
    json.url site_url(site, :json)
    json.(site, *Site.column_names.map(&:to_sym))
    json.source site.source  
  end
end