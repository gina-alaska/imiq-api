json.type 'Feature'.freeze
json.geometry site.wkt
json.properties do
  json.id site.id
  json.url site_url(site)
end
