json.type "FeatureCollection"
json.features @sites do |site|
  json.partial! site
end