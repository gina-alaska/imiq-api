# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140205012640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airtemp_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "annual_avgpeakmayjunedischarge_yearcount", id: false, force: true do |t|
    t.integer "siteid",           null: false
    t.string  "sitename"
    t.float   "avgpeakdischarge"
    t.integer "totalyears"
    t.float   "elevation"
    t.binary  "geolocation"
  end

  create_table "annual_avgsummerprecip_yearcount", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.float   "annualavg"
    t.integer "totalyears"
    t.float   "elevation"
    t.binary  "geolocation"
  end

  create_table "annual_avgsummerprecips", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgwinterprecip_yearcount", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.float   "annualavg"
    t.integer "totalyears"
    t.float   "elevation"
    t.binary  "geolocation"
  end

  create_table "annual_peakmayjunedischargedatavalues", primary_key: "valueid", force: true do |t|
    t.float   "datavalue"
    t.integer "year",               null: false
    t.integer "siteid",             null: false
    t.integer "originalvariableid", null: false
  end

  create_table "annual_winterprecips", id: false, force: true do |t|
    t.integer "siteid",        null: false
    t.integer "year"
    t.float   "seasonalvalue"
  end

  create_table "attributes", primary_key: "attributeid", force: true do |t|
    t.string "attributename", null: false
  end

  create_table "boundarycatalog", id: false, force: true do |t|
    t.integer "datastreamid",                        null: false
    t.string  "datastreamname",                      null: false
    t.integer "siteid",                              null: false
    t.string  "sitecode",                limit: 50,  null: false
    t.string  "sitename"
    t.integer "variableid",                          null: false
    t.string  "variablecode",            limit: 50,  null: false
    t.string  "variablename",                        null: false
    t.string  "speciation",                          null: false
    t.integer "variableunitsid",                     null: false
    t.string  "samplemedium",                        null: false
    t.string  "valuetype",                           null: false
    t.float   "timesupport",                         null: false
    t.integer "timeunitsid",                         null: false
    t.string  "datatype",                            null: false
    t.string  "generalcategory",                     null: false
    t.integer "methodid",                            null: false
    t.integer "deviceid",                            null: false
    t.text    "methoddescription",                   null: false
    t.integer "sourceid",                            null: false
    t.string  "organization",                        null: false
    t.text    "sourcedescription",                   null: false
    t.text    "citation",                            null: false
    t.integer "qualitycontrollevelid"
    t.string  "qualitycontrollevelcode", limit: 50,  null: false
    t.string  "begindatetime",           limit: 100
    t.string  "enddatetime",             limit: 100
    t.string  "begindatetimeutc",        limit: 100
    t.string  "enddatetimeutc",          limit: 100
    t.binary  "geolocation"
    t.string  "spatialcharacteristics",  limit: 50,  null: false
    t.integer "totalvalues"
  end

  create_table "boundarycatalog_62", id: false, force: true do |t|
    t.integer "datastreamid",                        null: false
    t.string  "datastreamname",                      null: false
    t.integer "siteid",                              null: false
    t.string  "sitecode",                limit: 50,  null: false
    t.string  "sitename"
    t.integer "variableid",                          null: false
    t.string  "variablecode",            limit: 50,  null: false
    t.string  "variablename",                        null: false
    t.string  "speciation",                          null: false
    t.integer "variableunitsid",                     null: false
    t.string  "samplemedium",                        null: false
    t.string  "valuetype",                           null: false
    t.float   "timesupport",                         null: false
    t.integer "timeunitsid",                         null: false
    t.string  "datatype",                            null: false
    t.string  "generalcategory",                     null: false
    t.integer "methodid",                            null: false
    t.integer "deviceid",                            null: false
    t.text    "methoddescription",                   null: false
    t.integer "sourceid",                            null: false
    t.string  "organization",                        null: false
    t.text    "sourcedescription",                   null: false
    t.text    "citation",                            null: false
    t.integer "qualitycontrollevelid"
    t.string  "qualitycontrollevelcode", limit: 50,  null: false
    t.string  "begindatetime",           limit: 100
    t.string  "enddatetime",             limit: 100
    t.string  "begindatetimeutc",        limit: 100
    t.string  "enddatetimeutc",          limit: 100
    t.binary  "geolocation"
    t.text    "geolocationtext"
    t.string  "spatialcharacteristics",  limit: 50,  null: false
    t.integer "totalvalues"
  end

  create_table "catalog", id: false, force: true do |t|
    t.integer "datastreamid",                        null: false
    t.string  "datastreamname",                      null: false
    t.integer "siteid",                              null: false
    t.string  "sitecode",                limit: 50,  null: false
    t.string  "sitename"
    t.integer "variableid",                          null: false
    t.string  "variablecode",            limit: 50,  null: false
    t.string  "variablename",                        null: false
    t.string  "speciation",                          null: false
    t.integer "variableunitsid",                     null: false
    t.string  "samplemedium",                        null: false
    t.string  "valuetype",                           null: false
    t.float   "timesupport",                         null: false
    t.integer "timeunitsid",                         null: false
    t.string  "datatype",                            null: false
    t.string  "generalcategory",                     null: false
    t.integer "methodid",                            null: false
    t.text    "methoddescription",                   null: false
    t.integer "sourceid",                            null: false
    t.string  "organization",                        null: false
    t.text    "sourcedescription",                   null: false
    t.text    "citation",                            null: false
    t.integer "qualitycontrollevelid"
    t.string  "qualitycontrollevelcode", limit: 50,  null: false
    t.string  "begindatetime",           limit: 100
    t.string  "enddatetime",             limit: 100
    t.string  "begindatetimeutc",        limit: 100
    t.string  "enddatetimeutc",          limit: 100
    t.binary  "geographylocation"
    t.string  "spatialcharacteristics",  limit: 50,  null: false
    t.integer "totalvalues"
  end

  create_table "categories", primary_key: "categoryid", force: true do |t|
    t.integer "variableid",          null: false
    t.string  "categoryname",        null: false
    t.text    "categorydescription"
  end

  create_table "censorcodecv", id: false, force: true do |t|
    t.string "term",       limit: 50, null: false
    t.text   "definition"
  end

  create_table "currentsites", id: false, force: true do |t|
    t.integer "siteid",       null: false
    t.string  "sitename"
    t.string  "organization", null: false
    t.integer "sourceid",     null: false
  end

  create_table "daily_airtemp", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_airtempdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  add_index "daily_airtempdatavalues", ["siteid"], name: "index_daily_airtempdatavalues_on_siteid", using: :btree

  create_table "daily_airtempmax", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_airtempmaxdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  create_table "daily_airtempmin", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_airtempmindatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  create_table "daily_discharge", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "sourceid",           null: false
    t.binary   "geographylocation"
  end

  create_table "daily_dischargedatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  add_index "daily_dischargedatavalues", ["siteid"], name: "index_daily_dischargedatavalues_on_siteid", using: :btree

  create_table "daily_precip", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_precipdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  add_index "daily_precipdatavalues", ["siteid"], name: "index_daily_precipdatavalues_on_siteid", using: :btree

  create_table "daily_rh", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "sourceid",           null: false
    t.binary   "geographylocation"
  end

  create_table "daily_rhdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  add_index "daily_rhdatavalues", ["siteid"], name: "index_daily_rhdatavalues_on_siteid", using: :btree

  create_table "daily_snowdepth", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_snowdepthdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  add_index "daily_snowdepthdatavalues", ["siteid"], name: "index_daily_snowdepthdatavalues_on_siteid", using: :btree

  create_table "daily_swe", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_swedatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  add_index "daily_swedatavalues", ["siteid"], name: "index_daily_swedatavalues_on_siteid", using: :btree

  create_table "daily_utcdatetime", id: false, force: true do |t|
    t.integer  "siteid",      null: false
    t.datetime "utcdatetime", null: false
  end

  create_table "daily_winddirection", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_winddirectiondatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
  end

  add_index "daily_winddirectiondatavalues", ["siteid"], name: "index_daily_winddirectiondatavalues_on_siteid", using: :btree

  create_table "daily_windspeed", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "daily_windspeeddatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
  end

  add_index "daily_windspeeddatavalues", ["siteid"], name: "index_daily_windspeeddatavalues_on_siteid", using: :btree

  create_table "datastreams", primary_key: "datastreamid", force: true do |t|
    t.string  "datastreamname",                                           null: false
    t.integer "siteid",                                                   null: false
    t.integer "variableid",                                               null: false
    t.string  "fieldname",             limit: 50
    t.integer "deviceid",                                                 null: false
    t.integer "methodid",                                                 null: false
    t.text    "comments"
    t.integer "qualitycontrollevelid"
    t.decimal "rangemin",                         precision: 8, scale: 2
    t.decimal "rangemax",                         precision: 8, scale: 2
    t.date    "startdate"
    t.date    "enddate"
    t.string  "annualtiming"
    t.date    "downloaddate"
  end

  create_table "datastreamvariables", id: false, force: true do |t|
    t.string  "datastreamname",                 null: false
    t.integer "siteid",                         null: false
    t.date    "startdate"
    t.date    "enddate"
    t.string  "fieldname",           limit: 50
    t.string  "variablename",                   null: false
    t.text    "variabledescription"
  end

  create_table "datatypecv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "datavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.float    "valueaccuracy"
    t.datetime "localdatetime",            null: false
    t.float    "utcoffset",                null: false
    t.integer  "qualifierid"
    t.integer  "derivedfromid"
    t.integer  "datastreamid",             null: false
    t.string   "censorcode",    limit: 50
    t.integer  "offsettypeid"
    t.float    "offsetvalue"
    t.integer  "categoryid"
  end

  create_table "datavaluesaggregate", id: false, force: true do |t|
    t.integer "datastreamid",                 null: false
    t.string  "begindatetime",    limit: 100
    t.string  "enddatetime",      limit: 100
    t.string  "begindatetimeutc", limit: 100
    t.string  "enddatetimeutc",   limit: 100
    t.integer "totalvalues"
  end

  create_table "datavaluesraw", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.float    "valueaccuracy"
    t.datetime "localdatetime", null: false
    t.float    "utcoffset",     null: false
    t.integer  "qualifierid"
    t.integer  "datastreamid",  null: false
  end

  add_index "datavaluesraw", ["datastreamid"], name: "datavaluesraw_datastreamid", unique: true, using: :btree
  add_index "datavaluesraw", ["localdatetime"], name: "datavaluesraw_localdatetime", unique: true, using: :btree

  create_table "derivedfrom", id: false, force: true do |t|
    t.integer "derivedfromid", null: false
    t.integer "valueid",       null: false
  end

  create_table "devices", primary_key: "deviceid", force: true do |t|
    t.string "devicename",                 null: false
    t.string "serialnumber",    limit: 50
    t.date   "dateactivated"
    t.date   "datedeactivated"
    t.text   "comments"
  end

  create_table "discharge_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "ext_arc_arc", force: true do |t|
    t.string "stream_cod"
    t.string "name"
    t.string "source"
    t.float  "shape_leng"
  end

  create_table "ext_arc_point", force: true do |t|
    t.float   "x_coord"
    t.float   "y_coord"
    t.float   "lat"
    t.float   "long_"
    t.string  "mtrs"
    t.string  "type"
    t.integer "plotsym"
    t.string  "quad"
    t.string  "stream_cod"
    t.string  "name"
    t.string  "specstr"
    t.integer "midangle"
  end

  create_table "ext_fws_fishsample", primary_key: "fishsampleid", force: true do |t|
    t.integer "siteid",                null: false
    t.string  "fishname"
    t.string  "fry",        limit: 50
    t.string  "juvenile",   limit: 50
    t.string  "adult",      limit: 50
    t.string  "anadromous", limit: 50
    t.string  "resident",   limit: 50
    t.string  "occasional", limit: 50
    t.string  "rearing",    limit: 50
    t.string  "feeding",    limit: 50
    t.string  "spawning",   limit: 50
    t.string  "overwinter", limit: 50
  end

  create_table "ext_reference", primary_key: "referenceid", force: true do |t|
    t.string  "referencename",     limit: 500
    t.string  "authors",           limit: 500
    t.string  "year",              limit: 50
    t.string  "title",             limit: 500
    t.string  "publication",       limit: 500
    t.string  "fishdatatype",      limit: 500
    t.string  "waterdatatype",     limit: 500
    t.integer "lakesreferenced"
    t.integer "riversreferenced"
    t.integer "springsreferenced"
    t.string  "pdf",               limit: 500
    t.string  "comments",          limit: 500
    t.string  "ref_id",            limit: 50
    t.string  "geographicarea",    limit: 500
  end

  create_table "ext_referencetowaterbody", force: true do |t|
    t.string "namereference"
    t.string "waterbodyid",   limit: 50
  end

  create_table "ext_waterbody", force: true do |t|
    t.integer "waterbodid",  limit: 8
    t.string  "watername"
    t.string  "watertype"
    t.string  "citation"
    t.float   "shape_leng"
    t.float   "shape_area"
    t.binary  "geoposition"
  end

  create_table "generalcategorycv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "geometry_columns", id: false, force: true do |t|
    t.string  "f_table_catalog",   limit: 256, null: false
    t.string  "f_table_schema",    limit: 256, null: false
    t.string  "f_table_name",      limit: 256, null: false
    t.string  "f_geometry_column", limit: 256, null: false
    t.integer "coord_dimension",               null: false
    t.integer "srid",                          null: false
    t.string  "type",              limit: 30,  null: false
  end

  create_table "groupdescriptions", primary_key: "groupid", force: true do |t|
    t.text "groupdescription"
  end

  create_table "groups", id: false, force: true do |t|
    t.integer "groupid", null: false
    t.integer "valueid", null: false
  end

  create_table "hourly_airtemp", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "hourly_airtempdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  create_table "hourly_precip", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "hourly_precipdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  create_table "hourly_rh", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "sourceid",           null: false
    t.binary   "geographylocation"
  end

  create_table "hourly_rhdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  create_table "hourly_snowdepth", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "hourly_snowdepthdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  create_table "hourly_swe", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "hourly_swedatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  create_table "hourly_utcdatetime", id: false, force: true do |t|
    t.integer  "siteid",      null: false
    t.datetime "utcdatetime", null: false
  end

  create_table "hourly_winddirection", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "hourly_winddirectiondatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
  end

  create_table "hourly_windspeed", id: false, force: true do |t|
    t.integer  "valueid",           null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",       null: false
    t.integer  "siteid",            null: false
    t.integer  "variableid",        null: false
    t.integer  "sourceid",          null: false
    t.binary   "geographylocation"
  end

  create_table "hourly_windspeeddatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
  end

  create_table "imiqversion", id: false, force: true do |t|
    t.string "versionnumber", limit: 50, null: false
  end

  create_table "incidents", primary_key: "incidentid", force: true do |t|
    t.integer  "siteid"
    t.integer  "datastreamid"
    t.datetime "starttime"
    t.string   "startprecision"
    t.datetime "endtime"
    t.string   "endprecision"
    t.string   "type",                      null: false
    t.text     "description"
    t.string   "reportedby",     limit: 96
    t.text     "comments"
  end

  create_table "isometadata", primary_key: "metadataid", force: true do |t|
    t.string "topiccategory",              default: "", null: false
    t.string "title",                      default: "", null: false
    t.text   "abstract",                                null: false
    t.string "profileversion",             default: "", null: false
    t.string "metadatalink",   limit: 500
  end

  create_table "methods", primary_key: "methodid", force: true do |t|
    t.string "methodname",                    null: false
    t.text   "methoddescription",             null: false
    t.string "methodlink",        limit: 500
  end

  add_index "methods", ["methodname"], name: "methods_methodname", unique: true, using: :btree

  create_table "monthly_airtemp", id: false, force: true do |t|
    t.integer "siteid",            null: false
    t.string  "sitename"
    t.binary  "geographylocation"
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  create_table "monthly_discharge", id: false, force: true do |t|
    t.integer "siteid",            null: false
    t.string  "sitename"
    t.binary  "geographylocation"
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  create_table "monthly_precip", id: false, force: true do |t|
    t.integer "siteid",            null: false
    t.string  "sitename"
    t.binary  "geographylocation"
    t.integer "year"
    t.integer "month"
    t.float   "monthlytotal"
    t.integer "total"
  end

  create_table "monthly_rh", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.text    "geolocation"
    t.integer "year"
    t.integer "month"
    t.float   "rh"
    t.float   "at"
    t.integer "total"
  end

  create_table "monthly_snowdepth", id: false, force: true do |t|
    t.integer "siteid",            null: false
    t.string  "sitename"
    t.binary  "geographylocation"
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  create_table "nhd_huc8", force: true do |t|
    t.integer "gaz_id",      limit: 8
    t.float   "area_acres"
    t.float   "area_sqkm"
    t.string  "states"
    t.date    "loaddate"
    t.string  "huc_8"
    t.string  "hu_8_name"
    t.float   "shape_leng"
    t.float   "shape_area"
    t.binary  "geoposition"
  end

  create_table "odmdatavalues", id: false, force: true do |t|
    t.integer  "valueid",                           null: false
    t.float    "datavalue"
    t.float    "valueaccuracy"
    t.datetime "localdatetime",                     null: false
    t.float    "utcoffset",                         null: false
    t.datetime "datetimeutc"
    t.integer  "siteid",                            null: false
    t.integer  "variableid",                        null: false
    t.float    "offsetvalue"
    t.integer  "offsettypeid"
    t.string   "censorcode",             limit: 50
    t.integer  "qualifierid"
    t.integer  "methodid",                          null: false
    t.integer  "sourceid",                          null: false
    t.integer  "derivedfromid"
    t.integer  "qualitycontrollevelid"
    t.binary   "geographylocation"
    t.string   "spatialcharacteristics", limit: 50, null: false
  end

  create_table "odmdatavalues_metric", id: false, force: true do |t|
    t.integer  "valueid",                           null: false
    t.float    "datavalue"
    t.float    "valueaccuracy"
    t.datetime "localdatetime",                     null: false
    t.float    "utcoffset",                         null: false
    t.datetime "datetimeutc"
    t.integer  "siteid",                            null: false
    t.integer  "originalvariableid",                null: false
    t.string   "variablename",                      null: false
    t.string   "samplemedium",                      null: false
    t.integer  "variableunitsid",                   null: false
    t.integer  "variabletimeunits",                 null: false
    t.float    "offsetvalue"
    t.integer  "offsettypeid"
    t.string   "censorcode",             limit: 50
    t.integer  "qualifierid"
    t.integer  "methodid",                          null: false
    t.integer  "sourceid",                          null: false
    t.integer  "derivedfromid"
    t.integer  "qualitycontrollevelid"
    t.binary   "geographylocation"
    t.text     "geolocation"
    t.string   "spatialcharacteristics", limit: 50, null: false
  end

  create_table "offsettypes", primary_key: "offsettypeid", force: true do |t|
    t.integer "offsetunitsid",     null: false
    t.text    "offsetdescription", null: false
  end

  create_table "organizationdescriptions", id: false, force: true do |t|
    t.integer "organizationid",                     null: false
    t.string  "organizationcode",        limit: 50, null: false
    t.text    "organizationdescription",            null: false
  end

  create_table "organizations", id: false, force: true do |t|
    t.integer "organizationid", null: false
    t.integer "sourceid",       null: false
  end

  create_table "precip_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "processing", primary_key: "processingid", force: true do |t|
    t.integer "sourceid"
    t.integer "siteid"
    t.integer "metadataid"
    t.string  "datarestrictions"
    t.integer "datapriority"
    t.text    "processingneeds"
    t.string  "qaqcperson"
    t.text    "qaqccomments"
    t.date    "qaqcdate"
  end

  create_table "qualifiers", primary_key: "qualifierid", force: true do |t|
    t.string "qualifiercode",        limit: 50
    t.text   "qualifierdescription",            null: false
  end

  create_table "qualitycontrollevels", primary_key: "qualitycontrollevelid", force: true do |t|
    t.string "qualitycontrollevelcode", limit: 50, null: false
    t.string "definition",                         null: false
    t.text   "explanation",                        null: false
  end

  create_table "queryme", id: false, force: true do |t|
    t.integer "siteid",                              null: false
    t.string  "sitename"
    t.string  "variablename",                        null: false
    t.text    "variabledescription"
    t.string  "samplemedium",                        null: false
    t.string  "organization",                        null: false
    t.text    "organizationdescription",             null: false
    t.string  "startdate",               limit: 100
    t.string  "enddate",                 limit: 100
    t.text    "citation",                            null: false
  end

  create_table "rasterdatavalues", primary_key: "valueid", force: true do |t|
    t.text     "datavalue"
    t.float    "valueaccuracy"
    t.datetime "localdatetime",            null: false
    t.float    "utcoffset",                null: false
    t.integer  "qualifierid"
    t.integer  "derivedfromid"
    t.integer  "datastreamid",             null: false
    t.string   "censorcode",    limit: 50
  end

  create_table "rh_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "samplemediumcv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "seriescatalog", id: false, force: true do |t|
    t.integer "datastreamid",                        null: false
    t.string  "datastreamname",                      null: false
    t.integer "siteid",                              null: false
    t.string  "sitecode",                limit: 50,  null: false
    t.string  "sitename"
    t.integer "variableid",                          null: false
    t.string  "variablecode",            limit: 50,  null: false
    t.string  "variablename",                        null: false
    t.string  "speciation",                          null: false
    t.integer "variableunitsid",                     null: false
    t.string  "samplemedium",                        null: false
    t.string  "valuetype",                           null: false
    t.float   "timesupport",                         null: false
    t.integer "timeunitsid",                         null: false
    t.string  "datatype",                            null: false
    t.string  "generalcategory",                     null: false
    t.integer "methodid",                            null: false
    t.text    "methoddescription",                   null: false
    t.integer "sourceid",                            null: false
    t.string  "organization",                        null: false
    t.text    "sourcedescription",                   null: false
    t.text    "citation",                            null: false
    t.integer "qualitycontrollevelid"
    t.string  "qualitycontrollevelcode", limit: 50,  null: false
    t.string  "begindatetime",           limit: 100
    t.string  "enddatetime",             limit: 100
    t.string  "begindatetimeutc",        limit: 100
    t.string  "enddatetimeutc",          limit: 100
    t.binary  "geolocation"
    t.string  "spatialcharacteristics",  limit: 50,  null: false
    t.integer "totalvalues"
    t.integer "startdecade"
    t.integer "enddecade"
    t.integer "totalyears"
  end

  create_table "seriescatalog_62", id: false, force: true do |t|
    t.integer "datastreamid",                        null: false
    t.string  "datastreamname",                      null: false
    t.integer "siteid",                              null: false
    t.string  "sitecode",                limit: 50,  null: false
    t.string  "sitename"
    t.integer "variableid",                          null: false
    t.string  "variablecode",            limit: 50,  null: false
    t.string  "variablename",                        null: false
    t.string  "speciation",                          null: false
    t.integer "variableunitsid",                     null: false
    t.string  "samplemedium",                        null: false
    t.string  "valuetype",                           null: false
    t.float   "timesupport",                         null: false
    t.integer "timeunitsid",                         null: false
    t.string  "datatype",                            null: false
    t.string  "generalcategory",                     null: false
    t.integer "methodid",                            null: false
    t.text    "methoddescription",                   null: false
    t.integer "sourceid",                            null: false
    t.string  "organization",                        null: false
    t.text    "sourcedescription",                   null: false
    t.text    "citation",                            null: false
    t.integer "qualitycontrollevelid"
    t.string  "qualitycontrollevelcode", limit: 50,  null: false
    t.string  "begindatetime",           limit: 100
    t.string  "enddatetime",             limit: 100
    t.string  "begindatetimeutc",        limit: 100
    t.string  "enddatetimeutc",          limit: 100
    t.binary  "geolocation"
    t.text    "geolocationtext"
    t.string  "spatialcharacteristics",  limit: 50,  null: false
    t.integer "totalvalues"
    t.integer "startdecade"
    t.integer "enddecade"
    t.integer "totalyears"
  end

  create_table "seriescatalog_62", id: false, force: true do |t|
    t.integer "datastreamid",                        null: false
    t.string  "datastreamname",                      null: false
    t.integer "siteid",                              null: false
    t.string  "sitecode",                limit: 50,  null: false
    t.string  "sitename"
    t.integer "variableid",                          null: false
    t.string  "variablecode",            limit: 50,  null: false
    t.string  "variablename",                        null: false
    t.string  "speciation",                          null: false
    t.integer "variableunitsid",                     null: false
    t.string  "samplemedium",                        null: false
    t.string  "valuetype",                           null: false
    t.float   "timesupport",                         null: false
    t.integer "timeunitsid",                         null: false
    t.string  "datatype",                            null: false
    t.string  "generalcategory",                     null: false
    t.integer "methodid",                            null: false
    t.text    "methoddescription",                   null: false
    t.integer "sourceid",                            null: false
    t.string  "organization",                        null: false
    t.text    "sourcedescription",                   null: false
    t.text    "citation",                            null: false
    t.integer "qualitycontrollevelid"
    t.string  "qualitycontrollevelcode", limit: 50,  null: false
    t.string  "begindatetime",           limit: 100
    t.string  "enddatetime",             limit: 100
    t.string  "begindatetimeutc",        limit: 100
    t.string  "enddatetimeutc",          limit: 100
    t.binary  "geolocation"
    t.text    "geolocationtext"
    t.string  "spatialcharacteristics",  limit: 50,  null: false
    t.integer "totalvalues"
    t.integer "startdecade"
    t.integer "enddecade"
    t.integer "totalyears"
  end

  create_table "siteattributes", id: false, force: true do |t|
    t.integer "siteid",           null: false
    t.integer "attributeid",      null: false
    t.string  "attributevalue",   null: false
    t.text    "attributecomment"
  end

  create_table "siteattributesource", id: false, force: true do |t|
    t.integer "sourceid",                        null: false
    t.integer "siteid",                          null: false
    t.string  "sitename"
    t.string  "organization",                    null: false
    t.text    "sourcedescription",               null: false
    t.string  "sourcelink",          limit: 500
    t.binary  "geographylocation"
    t.string  "attributevalue",                  null: false
    t.text    "sitecomments"
    t.text    "locationdescription"
    t.string  "sitecode",            limit: 50,  null: false
  end

  create_table "sitegeography", id: false, force: true do |t|
    t.integer "siteid",                            default: "nextval('sitegeography_siteid_seq'::regclass)", null: false
    t.string  "sitecode",               limit: 50,                                                           null: false
    t.string  "sitename"
    t.string  "spatialcharacteristics", limit: 50,                                                           null: false
    t.integer "sourceid",                                                                                    null: false
    t.string  "verticaldatum"
    t.integer "localprojectionid"
    t.float   "posaccuracy_m"
    t.string  "state"
    t.string  "county"
    t.text    "comments"
    t.integer "latlongdatumid",                                                                              null: false
    t.binary  "geographylocation"
    t.text    "locationdescription"
  end

  add_index "sitegeography", ["siteid"], name: "sitegeography_siteid", unique: true, using: :btree

  create_table "sites", primary_key: "siteid", force: true do |t|
    t.string  "sitecode",               limit: 50, null: false
    t.string  "sitename"
    t.string  "spatialcharacteristics", limit: 50, null: false
    t.integer "sourceid",                          null: false
    t.string  "verticaldatum"
    t.integer "localprojectionid"
    t.float   "posaccuracy_m"
    t.string  "state"
    t.string  "county"
    t.text    "comments"
    t.integer "latlongdatumid",                    null: false
    t.text    "geolocation"
    t.text    "locationdescription"
  end

  create_table "sitesource", id: false, force: true do |t|
    t.integer "sourceid",                           null: false
    t.integer "siteid",                             null: false
    t.string  "sitename"
    t.text    "sitecomments"
    t.string  "organization",                       null: false
    t.text    "sourcedescription",                  null: false
    t.string  "sourcelink",             limit: 500
    t.string  "spatialcharacteristics", limit: 50,  null: false
    t.binary  "geographylocation"
    t.text    "locationdescription"
    t.string  "sitecode",               limit: 50,  null: false
  end

  create_table "sitesourcedescription", id: false, force: true do |t|
    t.string  "organizationcode",        limit: 50,  null: false
    t.text    "organizationdescription",             null: false
    t.string  "contactname",                         null: false
    t.text    "sourcedescription",                   null: false
    t.string  "sourceorg",                           null: false
    t.string  "sourcelink",              limit: 500
    t.string  "sitename"
    t.binary  "geographylocation"
    t.string  "spatialcharacteristics",  limit: 50,  null: false
    t.text    "sitecomments"
    t.integer "siteid",                              null: false
    t.integer "sourceid",                            null: false
    t.integer "organizationid",                      null: false
  end

  create_table "snowdepth_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "sources", primary_key: "sourceid", force: true do |t|
    t.string  "organization",                               null: false
    t.text    "sourcedescription",                          null: false
    t.string  "sourcerole",        limit: 50,               null: false
    t.string  "sourcelink",        limit: 500
    t.string  "contactname",                   default: "", null: false
    t.string  "phone",                         default: "", null: false
    t.string  "email",                         default: "", null: false
    t.string  "address",                       default: "", null: false
    t.string  "city",                          default: "", null: false
    t.string  "state",                         default: "", null: false
    t.string  "zipcode",                       default: "", null: false
    t.text    "citation",                                   null: false
    t.integer "metadataid",                                 null: false
  end

  create_table "spatial_ref_sys", id: false, force: true do |t|
    t.integer "srid",                   null: false
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "spatialreferences", primary_key: "spatialreferenceid", force: true do |t|
    t.integer "srsid"
    t.string  "srsname",      null: false
    t.boolean "isgeographic"
    t.text    "notes"
  end

  create_table "speciationcv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "swe_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", force: true do |t|
    t.string  "name",         limit: 128, null: false
    t.integer "principal_id",             null: false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["name"], name: "sysdiagrams_name", unique: true, using: :btree
  add_index "sysdiagrams", ["principal_id"], name: "sysdiagrams_principal_id", unique: true, using: :btree

  create_table "topiccategorycv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "units", primary_key: "unitsid", force: true do |t|
    t.string "unitsname",         null: false
    t.string "unitstype",         null: false
    t.string "unitsabbreviation", null: false
  end

  create_table "valuetypecv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "variablenamecv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "variables", primary_key: "variableid", force: true do |t|
    t.string  "variablecode",        limit: 50,              null: false
    t.string  "variablename",                                null: false
    t.text    "variabledescription"
    t.string  "speciation",                     default: "", null: false
    t.integer "variableunitsid",                             null: false
    t.string  "samplemedium",                   default: "", null: false
    t.string  "valuetype",                      default: "", null: false
    t.boolean "isregular",                                   null: false
    t.float   "timesupport",                                 null: false
    t.integer "timeunitsid",                                 null: false
    t.string  "datatype",                       default: "", null: false
    t.string  "generalcategory",                default: "", null: false
    t.float   "nodatavalue",                                 null: false
  end

  add_index "variables", ["variablecode"], name: "variables_variablecode", unique: true, using: :btree
  add_index "variables", ["variablecode"], name: "variables_variablecode", unique: true, using: :btree

  create_table "variables", primary_key: "variableid", force: true do |t|
    t.string  "variablecode",        limit: 50,              null: false
    t.string  "variablename",                                null: false
    t.text    "variabledescription"
    t.string  "speciation",                     default: "", null: false
    t.integer "variableunitsid",                             null: false
    t.string  "samplemedium",                   default: "", null: false
    t.string  "valuetype",                      default: "", null: false
    t.boolean "isregular",                                   null: false
    t.float   "timesupport",                                 null: false
    t.integer "timeunitsid",                                 null: false
    t.string  "datatype",                       default: "", null: false
    t.string  "generalcategory",                default: "", null: false
    t.float   "nodatavalue",                                 null: false
  end

  add_index "variables", ["variablecode"], name: "variables_variablecode", unique: true, using: :btree
  add_index "variables", ["variablecode"], name: "variables_variablecode", unique: true, using: :btree

  create_table "verticaldatumcv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

  create_table "wd_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "ws_totalyears", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.string  "sitename"
    t.integer "totyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgfallairtemp", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgfallairtemps", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "yearly_avgfallprecip", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgfallprecips", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "monthlyavg"
  end

  create_table "yearly_avgpeakdischarge", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgpeakdischarges", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.string  "sitename"
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_avgpeaksnowdepth", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgpeaksnowdepths", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.string  "sitename"
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_avgpeakswe", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgpeakswes", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.string  "sitename"
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_avgspringairtemp", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgspringairtemps", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "yearly_avgspringprecip", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgspringprecips", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "monthlyavg"
  end

  create_table "yearly_avgsummerairtemp", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgsummerairtemps", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "yearly_avgsummerdischarge", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgsummerdischarges", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "yearly_avgsummerprecip", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgsummerprecips", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.string  "sitename"
    t.integer "year"
    t.float   "monthlyavg"
  end

  create_table "yearly_avgsummerrh", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgsummerrhs", id: false, force: true do |t|
    t.integer "siteid",        null: false
    t.integer "year"
    t.float   "seasonalavgrh"
    t.float   "seasonalavgat"
  end

  create_table "yearly_avgwinterairtemp", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgwinterairtemps", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "yearly_avgwinterprecip", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgwinterprecips", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.integer "year"
    t.float   "monthlyavg"
  end

  create_table "yearly_avgwinterrh", id: false, force: true do |t|
    t.integer "siteid",                  null: false
    t.string  "sitecode",     limit: 50, null: false
    t.string  "sitename"
    t.integer "sourceid",                null: false
    t.string  "organization",            null: false
    t.float   "avg"
    t.integer "totalyears"
    t.float   "latitude"
    t.float   "longitude"
    t.float   "elevation"
  end

  create_table "yearly_avgwinterrhs", id: false, force: true do |t|
    t.integer "siteid",        null: false
    t.integer "year"
    t.float   "seasonalavgrh"
    t.float   "seasonalavgat"
  end

  create_table "yearly_fallairtemps_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_fallprecips_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_peakdischarges", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
  end

  create_table "yearly_peaksnowdepths", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
  end

  create_table "yearly_peakswes", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
  end

  create_table "yearly_springairtemps_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_springprecips_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_summerairtemps_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_summerdischarges_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_summerprecips_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_summerrhs_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_winterairtemps_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_winterprecips_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

  create_table "yearly_winterrhs_avg", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avg"
    t.integer "totalyears"
  end

end
