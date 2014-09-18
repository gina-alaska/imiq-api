json.cache! site do
  json.type 'Feature'
  json.geometry site.wkt
  json.properties do
    json.id site.id
    json.url site_url(site)
  end
end
