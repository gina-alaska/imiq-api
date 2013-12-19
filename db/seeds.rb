# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

`unzip -d db/ db/seed_data.zip`


sites = JSON.parse(File.read('db/sites.json'))

sites.each do |site|
  Site.create(site)
end

sources = JSON.parse(File.read('db/sources.json'))

sources.each do |source|
  Source.create(source)
end

metadata = JSON.parse(File.read('db/metadata.json'))

metadata.each do |m|
  Metadata.create(m)
end

daily_airtempdatavalues = JSON.parse(File.read('db/daily_airtempdatavalue.json'))

daily_airtempdatavalues.each do |m|
  DailyAirtempdatavalue.create(m)
end

daily_rhdatavalues = JSON.parse(File.read('db/daily_rhdatavalue.json'))

daily_airtempdatavalues.each do |m|
  DailyRhdatavalue.create(m)
end

daily_precipdatavalues = JSON.parse(File.read('db/daily_precipdatavalue.json'))

daily_precipdatavalues.each do |m|
  DailyPrecipdatavalue.create(m)
end
