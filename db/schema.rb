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

ActiveRecord::Schema.define(version: 20140220002828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"
  enable_extension "autoinc"
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "chkpass"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "file_fdw"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "insert_username"
  enable_extension "intagg"
  enable_extension "intarray"
  enable_extension "lo"
  enable_extension "ltree"
  enable_extension "moddatetime"
  enable_extension "pageinspect"
  enable_extension "pg_buffercache"
  enable_extension "pg_freespacemap"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "refint"
  enable_extension "seg"
  enable_extension "tablefunc"
  enable_extension "timetravel"
  enable_extension "tsearch2"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"
  enable_extension "dblink"

  create_table "annual_avgairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgdischarge", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgfallairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgfallairtemp_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgfallprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgfallprecip_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgrh", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgrh_all", id: false, force: true do |t|
    t.integer "siteid", null: false
    t.integer "year"
    t.float   "rh"
    t.float   "at"
  end

  create_table "annual_avgspringairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgspringairtemp_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgspringprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgspringprecip_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgsummerairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgsummerairtemp_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgsummerdischarge", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgsummerdischarge_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgsummerprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgsummerprecip_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgsummerrh", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgsummerrh_all", id: false, force: true do |t|
    t.integer "siteid",        null: false
    t.integer "year"
    t.float   "seasonalavgrh"
    t.float   "seasonalavgat"
  end

  create_table "annual_avgwinterairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgwinterairtemp_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgwinterprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgwinterprecip_all", id: false, force: true do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
  end

  create_table "annual_avgwinterrh", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_avgwinterrh_all", id: false, force: true do |t|
    t.integer "siteid",        null: false
    t.integer "year"
    t.float   "seasonalavgrh"
    t.float   "seasonalavgat"
  end

  create_table "annual_peakdischarge", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_peakdischarge_all", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
  end

  create_table "annual_peaksnowdepth", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_peaksnowdepth_all", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
  end

  create_table "annual_peakswe", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_peakswe_all", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
  end

  create_table "annual_totalprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "annual_totalprecip_all", id: false, force: true do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
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
    t.float   "offsetvalue"
    t.integer "offsettypeid"
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
    t.float   "lat"
    t.float   "long"
    t.float   "elev"
    t.text    "geolocationtext"
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

  create_table "daily_airtemp", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_airtemp", ["siteid"], name: "daily_airtemp_siteid_idx", using: :btree

  create_table "daily_airtempdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_airtempdatavalues", ["siteid"], name: "daily_airtempdatavalues_siteid_idx", using: :btree

  create_table "daily_airtempmax", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_airtempmax", ["siteid"], name: "daily_airtempmax_siteid_idx", using: :btree

  create_table "daily_airtempmaxdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_airtempmaxdatavalues", ["siteid"], name: "daily_airtempmaxdatavalues_siteid_idx", using: :btree

  create_table "daily_airtempmin", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_airtempmin", ["siteid"], name: "daily_airtempmin_siteid_idx", using: :btree

  create_table "daily_airtempmindatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_airtempmindatavalues", ["siteid"], name: "daily_airtempmindatavalues_siteid_idx", using: :btree

  create_table "daily_discharge", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_discharge", ["siteid"], name: "daily_discharge_siteid_idx", using: :btree

  create_table "daily_dischargedatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
  end

  add_index "daily_dischargedatavalues", ["siteid"], name: "daily_dischargedatavalues_siteid_idx", using: :btree

  create_table "daily_precip", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_precip", ["siteid"], name: "daily_precip_siteid_idx", using: :btree

  create_table "daily_precip_thresholds", id: false, force: true do |t|
    t.integer "siteid",       null: false
    t.integer "minthreshold", null: false
    t.integer "maxthreshold", null: false
  end

  add_index "daily_precip_thresholds", ["siteid"], name: "daily_precip_thresholds_siteid_idx", using: :btree

  create_table "daily_precipdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_precipdatavalues", ["siteid"], name: "daily_precipdatavalues_siteid_idx", using: :btree

  create_table "daily_rh", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_rh", ["siteid"], name: "daily_rh_siteid_idx", using: :btree

  create_table "daily_rhdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_rhdatavalues", ["siteid"], name: "daily_rhdatavalues_siteid_idx", using: :btree

  create_table "daily_snowdepth", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_snowdepth", ["siteid"], name: "daily_snowdepth_siteid_idx", using: :btree

  create_table "daily_snowdepthdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_snowdepthdatavalues", ["siteid"], name: "daily_snowdepthdatavalues_siteid_idx", using: :btree

  create_table "daily_swe", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_swe", ["siteid"], name: "daily_swe_siteid_idx", using: :btree

  create_table "daily_swedatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_swedatavalues", ["siteid"], name: "daily_swedatavalues_siteid_idx", using: :btree

  create_table "daily_utcdatetime", id: false, force: true do |t|
    t.integer  "siteid",      null: false
    t.datetime "utcdatetime", null: false
  end

  add_index "daily_utcdatetime", ["siteid"], name: "daily_utcdatetime_siteid_idx", using: :btree

  create_table "daily_watertemp", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_watertemp", ["siteid"], name: "daily_watertemp_siteid_idx", using: :btree

  create_table "daily_watertempdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "daily_watertempdatavalues", ["siteid"], name: "daily_watertempdatavalues_siteid_idx", using: :btree

  create_table "daily_winddirection", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_winddirection", ["siteid"], name: "daily_winddirection_siteid_idx", using: :btree

  create_table "daily_winddirectiondatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
  end

  add_index "daily_winddirectiondatavalues", ["siteid"], name: "daily_winddirectiondatavalues_siteid_idx", using: :btree

  create_table "daily_windspeed", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "daily_windspeed", ["siteid"], name: "daily_windspeed_siteid_idx", using: :btree

  create_table "daily_windspeeddatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
  end

  add_index "daily_windspeeddatavalues", ["siteid"], name: "daily_windspeeddatavalues_siteid_idx", using: :btree

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
    t.string  "annualtiming"
    t.date    "downloaddate"
    t.string  "bdate",                 limit: 10
    t.string  "edate",                 limit: 10
  end

  add_index "datastreams", ["siteid"], name: "datastreams_siteid_idx", using: :btree

  create_table "datastreamvariables", id: false, force: true do |t|
    t.string  "datastreamname",                 null: false
    t.integer "siteid",                         null: false
    t.string  "bdate",               limit: 10
    t.string  "edate",               limit: 10
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
    t.float   "offsetvalue"
    t.integer "offsettypeid"
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

# Could not dump table "ext_arc_arc" because of following StandardError
#   Unknown type 'geometry' for column 'geom'

# Could not dump table "ext_arc_point" because of following StandardError
#   Unknown type 'geometry' for column 'geom'

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
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "hourly_airtemp", ["siteid"], name: "hourly_airtemp_siteid_idx", using: :btree

  create_table "hourly_airtempdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "hourly_airtempdatavalues", ["siteid"], name: "hourly_airtempdatavalues_siteid_idx", using: :btree

  create_table "hourly_precip", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "hourly_precip", ["siteid"], name: "hourly_precip_siteid_idx", using: :btree

  create_table "hourly_precipdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "hourly_precipdatavalues", ["siteid"], name: "hourly_precipdatavalues_siteid_idx", using: :btree

  create_table "hourly_rh", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "hourly_rh", ["siteid"], name: "hourly_rh_siteid_idx", using: :btree

  create_table "hourly_rhdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "hourly_rhdatavalues", ["siteid"], name: "hourly_rhdatavalues_siteid_idx", using: :btree

  create_table "hourly_snowdepth", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "hourly_snowdepth", ["siteid"], name: "hourly_snowdepth_siteid_idx", using: :btree

  create_table "hourly_snowdepthdatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "hourly_snowdepthdatavalues", ["siteid"], name: "hourly_snowdepthdatavalues_siteid_idx", using: :btree

  create_table "hourly_swe", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "hourly_swe", ["siteid"], name: "hourly_swe_siteid_idx", using: :btree

  create_table "hourly_swedatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
  end

  add_index "hourly_swedatavalues", ["siteid"], name: "hourly_swedatavalues_siteid_idx", using: :btree

  create_table "hourly_utcdatetime", id: false, force: true do |t|
    t.integer  "siteid",      null: false
    t.datetime "utcdatetime", null: false
  end

  add_index "hourly_utcdatetime", ["siteid"], name: "hourly_utcdatetime_siteid_idx", using: :btree

  create_table "hourly_winddirection", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "hourly_winddirection", ["siteid"], name: "hourly_winddirection_siteid_idx", using: :btree

  create_table "hourly_winddirectiondatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
  end

  add_index "hourly_winddirectiondatavalues", ["siteid"], name: "hourly_winddirectiondatavalues_siteid_idx", using: :btree

  create_table "hourly_windspeed", id: false, force: true do |t|
    t.integer  "valueid",            null: false
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
  end

  add_index "hourly_windspeed", ["siteid"], name: "hourly_windspeed_siteid_idx", using: :btree

  create_table "hourly_windspeeddatavalues", primary_key: "valueid", force: true do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
  end

  add_index "hourly_windspeeddatavalues", ["siteid"], name: "hourly_windspeeddatavalues_siteid_idx", using: :btree

  create_table "iarcod_summaries", id: false, force: true do |t|
    t.string  "tablename",                                      limit: 80
    t.text    "description"
    t.integer "variableid"
    t.string  "datatype",                                       limit: 80
    t.string  "variablename",                                   limit: 80
    t.string  "sensor_height",                                  limit: 80
    t.string  "sensor_height_units",                            limit: 80
    t.float   "minumum_value"
    t.float   "maximum_value"
    t.float   "maximum_value_for_hucs_60_61_62_63"
    t.float   "maximum_value_for_hucs_35_36_37_38_39_41_40_42"
    t.float   "maximum_value_for_arctic"
    t.float   "maximum_value_excluding_arctic"
    t.string  "units",                                          limit: 80
    t.string  "timestep",                                       limit: 80
    t.string  "timezone",                                       limit: 80
    t.text    "method"
    t.string  "minimum_datavalue_count",                        limit: 80
  end

  create_table "imiqversion", id: false, force: true do |t|
    t.string   "versionnumber",      limit: 50, null: false
    t.datetime "creationdate"
    t.text     "versiondescription"
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
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  add_index "monthly_airtemp", ["siteid"], name: "monthly_airtemp_siteid_idx", using: :btree

  create_table "monthly_airtemp_all", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  add_index "monthly_airtemp_all", ["siteid"], name: "monthly_airtemp_all_siteid_idx", using: :btree

  create_table "monthly_discharge", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  add_index "monthly_discharge", ["siteid"], name: "monthly_discharge_siteid_idx", using: :btree

  create_table "monthly_discharge_all", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  add_index "monthly_discharge_all", ["siteid"], name: "monthly_discharge_all_siteid_idx", using: :btree

  create_table "monthly_precip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  add_index "monthly_precip", ["siteid"], name: "monthly_precip_siteid_idx", using: :btree

  create_table "monthly_precip_all", id: false, force: true do |t|
    t.integer "siteid",       null: false
    t.integer "year"
    t.integer "month"
    t.float   "monthlytotal"
    t.integer "total"
  end

  add_index "monthly_precip_all", ["siteid"], name: "monthly_precip_all_siteid_idx", using: :btree

  create_table "monthly_rh", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  add_index "monthly_rh", ["siteid"], name: "monthly_rh_siteid_idx", using: :btree

  create_table "monthly_rh_all", id: false, force: true do |t|
    t.integer "siteid", null: false
    t.integer "year"
    t.integer "month"
    t.float   "rh"
    t.float   "at"
    t.integer "total"
  end

  add_index "monthly_rh_all", ["siteid"], name: "monthly_rh_all_siteid_idx", using: :btree

  create_table "monthly_snowdepth", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  add_index "monthly_snowdepth", ["siteid"], name: "monthly_snowdepthavg_siteid_idx", using: :btree

  create_table "monthly_snowdepth_all", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  add_index "monthly_snowdepth_all", ["siteid"], name: "monthly_snowdepthavg_all_siteid_idx", using: :btree

  create_table "monthly_snowdepthavg", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  add_index "monthly_snowdepthavg", ["siteid"], name: "monthly_snowdepthavg_siteid_idx", using: :btree

  create_table "monthly_snowdepthavg_all", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  add_index "monthly_snowdepthavg_all", ["siteid"], name: "monthly_snowdepthavg_all_siteid_idx", using: :btree

  create_table "monthly_sweavg", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  add_index "monthly_sweavg", ["siteid"], name: "monthly_sweavg_siteid_idx", using: :btree

  create_table "monthly_sweavg_all", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.integer "year"
    t.integer "month"
    t.float   "monthlyavg"
    t.integer "total"
  end

  add_index "monthly_sweavg_all", ["siteid"], name: "monthly_sweavg_all_siteid_idx", using: :btree

  create_table "multiyear_annual_all_avgairtemp", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgdischarge", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgfallairtemp", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgfallprecip", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgpeakdischarge", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgpeaksnowdepth", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgpeakswe", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgprecip", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgrh", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "rh"
    t.float   "at"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgspringairtemp", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgspringprecip", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgsummerairtemp", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgsummerdischarge", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgsummerprecip", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgsummerrh", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgwinterairtemp", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgwinterprecip", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_all_avgwinterrh", id: false, force: true do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
  end

  create_table "multiyear_annual_avgairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgdischarge", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgfallairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgfallprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgpeakdischarge", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgpeaksnowdepth", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgpeakswe", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgrh", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgspringairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgspringprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgsummerairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgsummerdischarge", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgsummerprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgsummerrh", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgwinterairtemp", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgwinterprecip", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "multiyear_annual_avgwinterrh", id: false, force: true do |t|
    t.integer  "valueid",            limit: 8
    t.float    "datavalue"
    t.integer  "siteid",                       null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid",           null: false
    t.integer  "variableid",                   null: false
  end

  create_table "networkdescriptions", id: false, force: true do |t|
    t.integer "networkid",                     null: false
    t.string  "networkcode",        limit: 50, null: false
    t.text    "networkdescription",            null: false
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
    t.integer "networkid"
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
    t.string  "organizationcode",        limit: 50,  null: false
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
    t.float   "offsetvalue"
    t.string  "unitsabbreviation"
    t.integer "offsettypeid"
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
    t.float   "lat"
    t.float   "long"
    t.float   "elev"
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

  create_table "sites", primary_key: "siteid", force: true do |t|
    t.string   "sitecode",               limit: 50, null: false
    t.string   "sitename"
    t.string   "spatialcharacteristics", limit: 50, null: false
    t.integer  "sourceid",                          null: false
    t.string   "verticaldatum"
    t.integer  "localprojectionid"
    t.float    "posaccuracy_m"
    t.string   "state"
    t.string   "county"
    t.text     "comments"
    t.integer  "latlongdatumid",                    null: false
    t.text     "geolocation"
    t.text     "locationdescription"
    t.datetime "updated_at"
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

  create_table "sources", primary_key: "sourceid", force: true do |t|
    t.string   "organization",                               null: false
    t.text     "sourcedescription",                          null: false
    t.string   "sourcerole",        limit: 50,               null: false
    t.string   "sourcelink",        limit: 500
    t.string   "contactname",                   default: "", null: false
    t.string   "phone",                         default: "", null: false
    t.string   "email",                         default: "", null: false
    t.string   "address",                       default: "", null: false
    t.string   "city",                          default: "", null: false
    t.string   "state",                         default: "", null: false
    t.string   "zipcode",                       default: "", null: false
    t.text     "citation",                                   null: false
    t.integer  "metadataid",                                 null: false
    t.datetime "updated_at"
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

  create_table "verticaldatumcv", id: false, force: true do |t|
    t.string "term",       null: false
    t.text   "definition"
  end

end
