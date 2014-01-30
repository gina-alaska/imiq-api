json.cache! ['v1', variable] do
  json.url variable_url(variable, :json)
  json.(variable, :variableid, :variablecode, :variablename, 
    :samplemedium, :datatype, :valuetype, :generalcategory)
end