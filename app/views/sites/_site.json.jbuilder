json.cache! ['v1', site] do
  json.(site, *Site.column_names.map(&:to_sym))
end