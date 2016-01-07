json.type 'FeatureCollection'.freeze
json.features do
  json.cache_collection! @sites do |site|
    json.partial! site
  end
end
