json.cache! ['v1', source] do
  json.url source_url(source, :json)
  json.(source, *Source.column_names.map(&:to_sym))
end