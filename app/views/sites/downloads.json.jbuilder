json.daily do
  @site.derived_variables.each do |name|
    json.set! name, daily_values_url(field: name, siteid: @site.siteid, format: 'csv')
  end
end
json.monthly
json.yearly