json.cache! ['v25', site, site.source, params[:verbose]] do
  json.type 'Feature'
  json.geometry site.wkt
  json.properties do
    json.id site.id
    json.url site_url(site)
  end
end
