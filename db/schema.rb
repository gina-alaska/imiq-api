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

ActiveRecord::Schema.define(version: 20150915215543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "postgis"
  enable_extension "postgis_topology"

  create_table "__archive_annual_avgairtemp", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This table is  annual air temperature averages using \"monthly_airtemp_all\".  Requires all 12 months to create annual air temperature average and the monthly average cannot be null.  Sets originalvariableid=697 and variableid=699." do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgairtemp_siteid_idx", using: :btree
  end

  create_table "__archive_annual_totalprecip", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_totalprecip\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid= and variableid=" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_totalprecip_siteid_idx", using: :btree
  end

  create_table "__archive_boundarycatalog", id: false, force: :cascade do |t|
    t.integer  "datastreamid"
    t.string   "datastreamname",          limit: 255
    t.integer  "siteid"
    t.string   "sitecode",                limit: 50
    t.string   "sitename",                limit: 255
    t.float    "offsetvalue"
    t.integer  "offsettypeid"
    t.integer  "variableid"
    t.string   "variablecode",            limit: 50
    t.string   "variablename",            limit: 255
    t.string   "speciation",              limit: 255
    t.integer  "variableunitsid"
    t.string   "samplemedium",            limit: 255
    t.string   "valuetype",               limit: 255
    t.float    "timesupport"
    t.integer  "timeunitsid"
    t.string   "datatype",                limit: 255
    t.string   "generalcategory",         limit: 255
    t.integer  "methodid"
    t.integer  "deviceid"
    t.text     "methoddescription"
    t.integer  "sourceid"
    t.string   "organization",            limit: 255
    t.text     "sourcedescription"
    t.text     "citation"
    t.integer  "qualitycontrollevelid"
    t.string   "qualitycontrollevelcode", limit: 50
    t.datetime "begindatetime"
    t.datetime "enddatetime"
    t.datetime "begindatetimeutc"
    t.datetime "enddatetimeutc"
    t.float    "lat"
    t.float    "long"
    t.float    "elev"
    t.text     "geolocationtext"
    t.string   "spatialcharacteristics",  limit: 50
    t.bigint   "totalvalues"
    t.bigint   "totalmissingvalues"
    t.index ["siteid"], name: "boundarycatalog_siteid_idx_archive", using: :btree
  end

  create_table "__archive_daily_airtemp", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: -80F <= DataValue < 115F.  Sets the daily air temperature variableid = 686" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_airtemp_siteid_idx", using: :btree
  end

  create_table "__archive_daily_precip", primary_key: "valueid", id: :integer, force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid",         default: 690, null: false
    t.index ["siteid"], name: "daily_precip_siteid_idx", using: :btree
  end

  create_table "__archive_daily_snowdepth", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: 0m <= datavalue < 12m.  Sets the daily snow depth variableid = 692" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_snowdepth_siteid_idx", using: :btree
  end

  create_table "__archive_daily_swe", primary_key: "valueid", id: :integer, force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "daily_swe_siteid_idx", using: :btree
  end

  create_table "__archive_daily_windspeed", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts the data values to the range: datavalue >= 0 and datavalue < 50.  Sets the daily wind speed variableid=696" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_windspeed_siteid_idx", using: :btree
  end

  create_table "__archive_datavaluesaggregate", id: false, force: :cascade do |t|
    t.integer  "datastreamid"
    t.float    "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "begindatetime"
    t.datetime "enddatetime"
    t.datetime "begindatetimeutc"
    t.datetime "enddatetimeutc"
    t.bigint   "totalvalues"
    t.bigint   "missingdatavaluestotal"
  end

  create_table "__archive_hourly_airtemp", primary_key: "valueid", id: :integer, force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "hourly_airtemp_siteid_idx", using: :btree
  end

  create_table "__archive_hourly_precip", primary_key: "valueid", id: :integer, force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid",         default: 678, null: false
    t.index ["siteid"], name: "hourly_precip_siteid_idx", using: :btree
  end

  create_table "__archive_hourly_snowdepth", primary_key: "valueid", id: :integer, force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "hourly_snowdepth_siteid_idx", using: :btree
  end

  create_table "__archive_hourly_swe", primary_key: "valueid", id: :integer, force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "hourly_swe_siteid_idx", using: :btree
  end

  create_table "__archive_hourly_windspeed", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: datavalue >= 0 and datavalue < 50.  Sets the hourly wind speed variableid=685" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "hourly_windspeed_siteid_idx", using: :btree
  end

  create_table "__archive_monthly_airtemp", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"monthly_air temp\" with the fields: valueid, datavalue,siteid,utcdatetime,originalvariableid and variableid.  Sets the monthly air temperature variableid=697 and originalvariableid=686.  " do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "monthly_airtemp_siteid_idx", using: :btree
  end

  create_table "__archive_monthly_precip", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"monthly_precip\" with the fields: valueid, datavalue,siteid,utcdatetime,originalvariableid,variableid.  Sets the originalvariableid=690 and variableid=701" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "monthly_precip_siteid_idx", using: :btree
  end

  create_table "__archive_monthly_snowdepthavg", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"monthly_snowdepthavg\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets the originalvariableid=692 and variableid=702" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "monthly_snowdepthavg_siteid_idx", using: :btree
  end

  create_table "__archive_monthly_sweavg", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"monthly_sweavg\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=693 and variableid=721" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "monthly_sweavg_siteid_idx", using: :btree
  end

  create_table "__archive_seriescatalog", id: false, force: :cascade do |t|
    t.integer  "datastreamid"
    t.string   "datastreamname",          limit: 255
    t.integer  "siteid"
    t.string   "sitecode",                limit: 50
    t.string   "sitename",                limit: 255
    t.float    "offsetvalue"
    t.string   "unitsabbreviation",       limit: 255
    t.integer  "offsettypeid"
    t.integer  "variableid"
    t.string   "variablecode",            limit: 50
    t.string   "variablename",            limit: 255
    t.string   "speciation",              limit: 255
    t.integer  "variableunitsid"
    t.string   "samplemedium",            limit: 255
    t.string   "valuetype",               limit: 255
    t.float    "timesupport"
    t.integer  "timeunitsid"
    t.string   "datatype",                limit: 255
    t.string   "generalcategory",         limit: 255
    t.integer  "methodid"
    t.text     "methoddescription"
    t.integer  "sourceid"
    t.string   "organization",            limit: 255
    t.text     "sourcedescription"
    t.text     "citation"
    t.integer  "qualitycontrollevelid"
    t.string   "qualitycontrollevelcode", limit: 50
    t.datetime "begindatetime"
    t.datetime "enddatetime"
    t.datetime "begindatetimeutc"
    t.datetime "enddatetimeutc"
    t.float    "lat"
    t.float    "long"
    t.float    "elev"
    t.text     "geolocationtext"
    t.string   "spatialcharacteristics",  limit: 50
    t.bigint   "totalvalues"
    t.bigint   "totalmissingvalues"
    t.integer  "startdecade"
    t.integer  "enddecade"
    t.float    "totalyears"
  end

  create_table "__depreciated_annual_totalprecip_all", id: false, force: :cascade do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
    t.index ["siteid"], name: "annual_totalprecip_all_siteid_idx", using: :btree
  end

  create_table "__depreciated_daily_precip_thresholds", id: false, force: :cascade do |t|
    t.integer "siteid",       null: false
    t.integer "minthreshold", null: false
    t.integer "maxthreshold", null: false
    t.index ["siteid"], name: "daily_precip_thresholds_siteid_idx", using: :btree
  end

  create_table "__depreciated_monthly_airtemp_all", id: false, force: :cascade, comment: "This view creates monthly averages using \"daily_airtemp\".  Restricted to months with at least 10 days of data." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "month"
    t.float   "monthlyavg"
    t.bigint  "total"
    t.index ["siteid"], name: "monthly_airtemp_all_siteid_idx", using: :btree
  end

  create_table "__depreciated_monthly_precip_all", id: false, force: :cascade, comment: "This view creates monthly totals using \"daily_precip\".  Restricted to months with at least 10 days of data." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "month"
    t.float   "monthlytotal"
    t.bigint  "total"
    t.index ["siteid"], name: "monthly_precip_all_siteid_idx", using: :btree
  end

  create_table "__depreciated_monthly_snowdepthavg_all", id: false, force: :cascade, comment: "This view creates monthly averages using \"daily_snowdepth\".  Restricted to months with at least 1 day of data." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "month"
    t.float   "monthlyavg"
    t.bigint  "total"
    t.index ["siteid"], name: "monthly_snowdepthavg_all_siteid_idx", using: :btree
  end

  create_table "__depreciated_monthly_sweavg_all", id: false, force: :cascade, comment: "This view creates monthly averages using \"daily_swe\".  Restricted to months with at least 1 day or data." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "month"
    t.float   "monthlyavg"
    t.bigint  "total"
    t.index ["siteid"], name: "monthly_sweavg_all_idx", using: :btree
  end

  create_table "_sites_summary", id: false, force: :cascade do |t|
    t.integer "siteid",                 null: false
    t.text    "geolocation",            null: false
    t.string  "begindate",   limit: 10, null: false
    t.string  "enddate",     limit: 10, null: false
  end

  create_table "_siteswithelevations", id: false, force: :cascade do |t|
    t.integer "siteid"
    t.text    "geolocation"
    t.text    "sourcedatum"
  end

  create_table "annual_airtemps", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "annual_avgdischarge", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This creates annual discharge averages using \"monthly_discharge_all\".  Requires all 12 months to create annual discharge averages and the monthly average cannot be null.  Sets originalvariableid=700 and variableid=710." do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgdischarge_siteid_idx", using: :btree
  end

  create_table "annual_avgfallairtemp", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgfallairtemp\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=697 and variableid=722." do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgfallairtemp_siteid_idx", using: :btree
  end

  create_table "annual_avgfallairtemp_all", id: false, force: :cascade, comment: "This creates annual fall air temperature averages using \"monthly_airtemp_all\".  Requires all three months; September, October and November; to create annual fall average.  " do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgfallairtemp_all_siteid_idx", using: :btree
  end

  create_table "annual_avgfallprecip", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgfallprecip\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=701 and variableid=729" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgfallprecip_siteid_idx", using: :btree
  end

  create_table "annual_avgfallprecip_all", id: false, force: :cascade, comment: "This view creates annual average fall precipitation total using \"monthly_precip_all\".  Requires all three months; September, October and November; to create annual average total." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgfallprecip_all_siteid_idx", using: :btree
  end

  create_table "annual_avgrh", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgrh\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets variableid=708 and originalvariableid=707" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgrh_siteid_idx", using: :btree
  end

  create_table "annual_avgrh_all", id: false, force: :cascade do |t|
    t.integer "siteid", null: false
    t.integer "year"
    t.float   "rh"
    t.float   "at"
    t.index ["siteid"], name: "annual_avgrh_all_siteid_idx", using: :btree
  end

  create_table "annual_avgspringairtemp", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgspringairtemp\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=697 and variableid=724" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgspringairtemp_siteid_idx", using: :btree
  end

  create_table "annual_avgspringairtemp_all", id: false, force: :cascade, comment: "This view creates annual spring air temperature averages using \"monthly_airtemp_all\".  Requires all three months; March, April and May; to create annual spring air temperature average." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgspringairtemp_all_siteid_idx", using: :btree
  end

  create_table "annual_avgspringprecip", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgspringprecip\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=701 and variableid=733" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgspringprecip_siteid_idx", using: :btree
  end

  create_table "annual_avgspringprecip_all", id: false, force: :cascade, comment: "This view creates annual spring precipitation total averages using \"monthly_precip_all\".  Requires all three months: March, April and May; to create annual spring precipitation total average." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgspringprecip_all_siteid_idx", using: :btree
  end

  create_table "annual_avgsummerairtemp", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This table creates \"annual_avgsummerairtemp_2\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=697 and variableid=726" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgsummerairtemp_siteid_idx", using: :btree
  end

  create_table "annual_avgsummerairtemp_all", id: false, force: :cascade, comment: "This view creates annual summer air temperature averages using \"monthly_airtemp_all\".  Requires all three months; June, July and August; to create annual summer air temperature average" do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgsummerairtemp_all_siteid_idx", using: :btree
  end

  create_table "annual_avgsummerdischarge", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgsummerdischarge\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=700 and variableid=737" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgsummerdischarge_siteid_idx", using: :btree
  end

  create_table "annual_avgsummerdischarge_all", id: false, force: :cascade, comment: "This view creates annual average summer discharge using \"monthly_discharge_all\".  Requires all three months; June, July, August; to create annual average summer discharge." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgsummerdischarge_all_idx", using: :btree
  end

  create_table "annual_avgsummerprecip", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgsummerprecip_2\" with the fields: valueid, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=701 and variableid=735" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgsummerprecip_siteid_idx", using: :btree
  end

  create_table "annual_avgsummerprecip_all", id: false, force: :cascade, comment: "This view creates annual average summer precipitation totals using \"monthly_precip_all\".  Requires all three months; June, July, August; to create annual average summer precipitation totals." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgsummerprecip_all_siteid_idx", using: :btree
  end

  create_table "annual_avgsummerrh", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgsummerrh_2\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=707 and variableid=739." do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgsummerrh_siteid_idx", using: :btree
  end

  create_table "annual_avgsummerrh_all", id: false, force: :cascade, comment: "This view creates annual average summer relative humidity by calculating the seasonal relative humdity using the monthly air temperature and monthly relative humidity averages.   Requires all three months; June, July, August; to create annual average summer relative humidity" do |t|
    t.integer "siteid"
    t.integer "year"
    t.float   "seasonalavgrh"
    t.float   "seasonalavgat"
    t.index ["siteid"], name: "annual_avgsummerrh_all_siteid_idx", using: :btree
  end

  create_table "annual_avgwinterairtemp", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgwinterairtemp\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=697 and variableid=719" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgwinterairtemp_siteid_idx", using: :btree
  end

  create_table "annual_avgwinterairtemp_all", id: false, force: :cascade do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgwinterairtemp_all_siteid_idx", using: :btree
  end

  create_table "annual_avgwinterprecip", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgwinterprecip\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=701 and variableid=731" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgwinterprecip_siteid_idx", using: :btree
  end

  create_table "annual_avgwinterprecip_all", id: false, force: :cascade do |t|
    t.integer "siteid",      null: false
    t.integer "year"
    t.float   "seasonalavg"
    t.index ["siteid"], name: "annual_avgwinterprecip_all_siteid_idx", using: :btree
  end

  create_table "annual_avgwinterrh", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_avgwinterrh\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=707 and vairableid=741" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_avgwinterrh_siteid_idx", using: :btree
  end

  create_table "annual_avgwinterrh_all", id: false, force: :cascade do |t|
    t.integer "siteid",        null: false
    t.integer "year"
    t.float   "seasonalavgrh"
    t.float   "seasonalavgat"
    t.index ["siteid"], name: "annual_avgwinterrh_all_siteid_idx", using: :btree
  end

  create_table "annual_discharges", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "annual_peakdischarge", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_peakdischarge\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=689 and variableid=712" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_peakdischarge_siteid_idx", using: :btree
  end

  create_table "annual_peakdischarge_all", id: false, force: :cascade do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
    t.index ["siteid"], name: "annual_peakdischarge_all_siteid_idx", using: :btree
  end

  create_table "annual_peaksnowdepth", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_peaksnowdepth\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets the originalvariableid=692 and variableid=705" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_peaksnowdepth_siteid_idx", using: :btree
  end

  create_table "annual_peaksnowdepth_all", id: false, force: :cascade, comment: "This view creates \"annual_peaksnowdepth_all\" from daily summary table" do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "datavalue"
    t.index ["siteid"], name: "annual_peaksnowdepth_all_siteid_idx", using: :btree
  end

  create_table "annual_peakswe", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"annual_peakswe\" with the fields: valueid, datavalue, siteid, utcdatetime, originalvariableid and variableid.  Sets originalvariableid=693 and variableid=717" do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "annual_peakswe_siteid_idx", using: :btree
  end

  create_table "annual_peakswe_all", id: false, force: :cascade do |t|
    t.integer "siteid",    null: false
    t.integer "year"
    t.float   "datavalue"
    t.index ["siteid"], name: "annual_peakswe_all_siteid_idx", using: :btree
  end

  create_table "annual_rhs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attributes", primary_key: "attributeid", force: :cascade, comment: "Describes non-numeric data values for a Site." do |t|
    t.string "attributename", limit: 255, null: false, comment: "The name of the attribute."
  end

  create_table "categories", primary_key: "categoryid", force: :cascade do |t|
    t.integer "variableid",                      null: false, comment: "Integer identifier that references the record in the Variables table."
    t.string  "categoryname",        limit: 255, null: false, comment: "Category name that is used to describe the category."
    t.text    "categorydescription",                          comment: "Category definition."
  end

  create_table "censorcodecv", primary_key: "term", id: :string, limit: 50, comment: "Controlled vocabulary for CensorCode.", force: :cascade, comment: "The CensorCodeCV table contains the controlled vocabulary for censor codes. Only values from the Term field in this table can be used to populate the CensorCode field of the DataValues table." do |t|
    t.text "definition", comment: "Definition of CensorCode controlled vocabulary term. The definition is optional if the term is self explanatory."
  end

  create_table "daily_airtempdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_airtempdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_airtempdatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "daily_airtempmax", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: -80F <= datavalue < 115F.  Sets the daily max air temperature variableid = 687" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_airtempmax_siteid_idx", using: :btree
  end

  create_table "daily_airtempmaxdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_airtempmaxdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_airtempmaxdatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "daily_airtempmin", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: -80F <= datavalue < 115F.  Sets the daily min air temperature variableid = 688" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_airtempmin_siteid_idx", using: :btree
  end

  create_table "daily_airtempmindatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_airtempmindatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_airtempmindatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "daily_discharge", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: datavalue >=0.  Sets the daily discharge variableid=689." do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_discharge_siteid_idx", using: :btree
  end

  create_table "daily_dischargedatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_dischargedatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_dischargedatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree
  end

  create_table "daily_precipdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_precipdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_precipdatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "daily_rh", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: datavalue > 0 and datadalue <= 100.  Sets the daily relative humidity variableid=691" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_rh_siteid_idx", using: :btree
  end

  create_table "daily_rhdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_rhdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_rhdatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique idx"
  end

  create_table "daily_snowdepthdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_snowdepthdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_snowdepthdatavalues_utcdatetime_siteid_orignalvarialeid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "daily_swedatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_swedatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_swedatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "creating unique index"
  end

  create_table "daily_watertemp", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to those which are not null.  Sets the daily water temperature variableid=694." do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_watertemp_siteid_idx", using: :btree
  end

  create_table "daily_watertempdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_watertempdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "daily_watertempdatavalues_utcdatetime_siteid_orignalvaribleid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "daily_winddirection", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: datavalue >= 0 and datavalue <= 360.  Sets the daily wind direction variableid=695." do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "daily_winddirection_siteid_idx", using: :btree
  end

  create_table "daily_winddirectiondatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_winddirectiondatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid", "offsetvalue"], name: "daily_winddirectiondatavalues_utcdatetime_siteid_orignalvariabl", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "daily_windspeeddatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
    t.index ["siteid"], name: "daily_windspeeddatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid", "offsetvalue"], name: "daily_windspeeddatavalues_utctimestamp_siteid_orignalvariableid", unique: true, using: :btree
  end

  create_table "datastreams", primary_key: "datastreamid", force: :cascade, comment: "The datasteam assigns a variable to a station.  It also includes additional information that can be used for QA/QC on the data values for this station." do |t|
    t.string  "datastreamname",        limit: 255,                         null: false, comment: "Name of the datastream.  Example: SiteName_VariableName"
    t.integer "siteid",                                                    null: false, comment: "Integer identifier that references the record in the Sites table."
    t.integer "variableid",                                                null: false, comment: "Integer identifier that references the record in the Variables table."
    t.string  "fieldname",             limit: 50,                                       comment: "Name of the fieldname that is used in the data file."
    t.integer "deviceid",                                                  null: false, comment: "Integer identifier that references the record in the Devices table."
    t.integer "methodid",                                                  null: false, comment: "Integer identifier that references the record in the Methods table."
    t.text    "comments",                                                               comment: "Notes concerning datastream, such as flag or notes from data logger files."
    t.integer "qualitycontrollevelid",                                                  comment: "Integer identifier that references the record in the QualityControlLevels table."
    t.decimal "rangemin",                          precision: 8, scale: 2,              comment: "The acceptable range minimum for the sensor. "
    t.decimal "rangemax",                          precision: 8, scale: 2,              comment: "The acceptable range maximum for the sensor"
    t.string  "annualtiming",          limit: 255,                                      comment: "Known range"
    t.date    "downloaddate",                                                           comment: "Date the dataset was downloaded or acquired"
    t.string  "bdate",                 limit: 10
    t.string  "edate",                 limit: 10
    t.index ["siteid"], name: "datastreams_siteid_idx", using: :btree
  end

  create_table "datatypecv", primary_key: "term", id: :string, limit: 255, comment: "Controlled vocabulary for DataType.", force: :cascade, comment: "The DataTypeCV table contains the controlled vocabulary for data types. Only values from the Term field in this table can be used to populate the DataType field in the Variables table." do |t|
    t.text "definition", comment: "Definition of DataType controlled vocabulary term. The definition is optional if the term is self explanatory."
  end

  create_table "datavalues", primary_key: "valueid", force: :cascade, comment: "The DataValues table contains the actual data values." do |t|
    t.float    "datavalue",                             comment: "The numeric value of the observation. For Categorical variables, a number is stored here. The Variables table has DataType as Categorical and the Categories table maps from the DataValue onto Category Description."
    t.float    "valueaccuracy",                         comment: "Numeric value that describes the measurement accuracy of the data value. If not given, it is interpreted as unknown."
    t.datetime "localdatetime",            null: false, comment: "Local date and time at which the data value was observed. Represented in an implementation specific format."
    t.float    "utcoffset",                null: false, comment: "Offset in hours from UTC time of the corresponding LocalDateTime value."
    t.integer  "qualifierid",                           comment: "Integer identifier that references the quality of the data in the Qualifiers table."
    t.integer  "derivedfromid",                         comment: "Integer identifier that references the derived data in the DerivedFrom table."
    t.integer  "datastreamid",             null: false, comment: "Integer identifier that references the datastream in the Datastreams table."
    t.string   "censorcode",    limit: 50,              comment: "Text indication of whether the data value is censored from the CensorCodeCV controlled vocabulary."
    t.integer  "offsettypeid",                          comment: "Foreign key OffsetTypes.  The reference point from which the offset to the measurement location was measured (e.g. water surface, stream bank, snow surface)"
    t.float    "offsetvalue",                           comment: "Distance from a reference point to the location at which the observation was made (e.g. 5 meters below water surface)"
    t.integer  "categoryid",                            comment: "FK to the Category table.  This field will contain a value if there is categorical data."
    t.index ["datastreamid", "localdatetime", "offsetvalue"], name: "datavalues_datastreamid_localdatetime_offsetvalue", unique: true, using: :btree
    t.index ["datastreamid", "localdatetime"], name: "datavalues_datastreamid_localdatetime", unique: true, where: "(offsettypeid IS NULL)", using: :btree, comment: "added unique index"
    t.index ["datastreamid"], name: "datavalues_datastreamid", using: :btree
  end

  create_table "datavaluesraw", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.float    "valueaccuracy"
    t.datetime "localdatetime", null: false
    t.float    "utcoffset",     null: false
    t.integer  "qualifierid"
    t.integer  "datastreamid",  null: false
    t.index ["datastreamid"], name: "datavaluesraw_datastreamid", unique: true, using: :btree
    t.index ["localdatetime"], name: "datavaluesraw_localdatetime", unique: true, using: :btree
  end

  create_table "derivedfrom", primary_key: "derivedfromid", id: :integer, comment: "Integer identifying the group of data values from which a quantity is derived.", force: :cascade, comment: "The DerivedFrom table contains the linkage between derived data values and the data values that they were derived from." do |t|
    t.integer "valueid", null: false, comment: "Integer identifier referencing data values that comprise a group from which a quantity is derived. This corresponds to ValueID in the DataValues table."
  end

  create_table "devices", primary_key: "deviceid", force: :cascade do |t|
    t.string "devicename",      limit: 255, null: false
    t.string "serialnumber",    limit: 50
    t.date   "dateactivated"
    t.date   "datedeactivated"
    t.text   "comments"
  end

# Could not dump table "ext_arc_arc" because of following StandardError
#   Unknown type 'public.geometry' for column 'geom'

# Could not dump table "ext_arc_point" because of following StandardError
#   Unknown type 'public.geometry' for column 'geom'

  create_table "ext_fws_fishsample", primary_key: "fishsampleid", force: :cascade do |t|
    t.integer "siteid",                 null: false
    t.string  "fishname",   limit: 255
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

  create_table "ext_reference", primary_key: "referenceid", force: :cascade do |t|
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

  create_table "ext_referencetowaterbody", force: :cascade do |t|
    t.string "namereference", limit: 255
    t.string "waterbodyid",   limit: 50
  end

  create_table "ext_waterbody", force: :cascade do |t|
    t.bigint "waterbodid"
    t.string "watername",   limit: 255
    t.string "watertype",   limit: 255
    t.string "citation",    limit: 255
    t.float  "shape_leng"
    t.float  "shape_area"
    t.binary "geoposition"
  end

  create_table "fifteenmin_watertemp", primary_key: "valueid", id: :integer, force: :cascade, comment: "This table creates \"_15min_watertemp\" with the fields: valueid,datavalue,siteid,utcdatetime,originalvariableid and variableid" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "_15min_watertemp_test_siteid_idx", using: :btree
  end

  create_table "generalcategorycv", primary_key: "term", id: :string, limit: 255, force: :cascade do |t|
    t.text "definition"
  end

  create_table "groupdescriptions", primary_key: "groupid", force: :cascade, comment: "The GroupDescriptions table lists the descriptions for each of the groups of data values that have been formed." do |t|
    t.text "groupdescription", comment: "Text description of the group."
  end

  create_table "groups", id: false, force: :cascade, comment: "The Groups table lists the groups of data values that have been created and the data values that are within each group." do |t|
    t.integer "groupid", null: false, comment: "Integer ID for each group of data values that has been formed."
    t.integer "valueid", null: false, comment: "Integer identifier for each data value that belongs to a group. This corresponds to ValueID in the DataValues table"
  end

  create_table "hourly_airtempdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "hourly_airtempdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "hourly_airtempdatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "hourly_precipdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "hourly_precipdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "hourly_precipdatavalues_utctimestamps_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique id"
  end

  create_table "hourly_rh", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: datavalue > 0 and datavalue <= 100.  Sets the hourly relative humidity variableid=679" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "hourly_rh_siteid_idx", using: :btree
  end

  create_table "hourly_rhdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "hourly_rhdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "hourly_rhdatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added new index"
  end

  create_table "hourly_snowdepthdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "hourly_snowdepthdatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "hourly_snowdepthdatavalues_utcdatetime_siteid_orignalvaribleid", unique: true, using: :btree, comment: "added unique idx"
  end

  create_table "hourly_swedatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.datetime "insertdate"
    t.index ["siteid"], name: "hourly_swedatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid"], name: "hourly_swedatavalues_utctimestamp_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique idx"
  end

  create_table "hourly_winddirection", primary_key: "valueid", id: :integer, force: :cascade, comment: "This view restricts data values to the range: datavalue >= 0 and datavalue <= 360.  Sets the hourly wind direction variableid=682" do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime"
    t.integer  "siteid"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "hourly_winddirection_siteid_idx", using: :btree
  end

  create_table "hourly_winddirectiondatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
    t.index ["siteid"], name: "hourly_winddirectiondatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid", "offsetvalue"], name: "hourly_winddirectiondatavalues_utctimestamp_siteid_orignalvaria", unique: true, using: :btree, comment: "added uniuque id"
  end

  create_table "hourly_windspeeddatavalues", primary_key: "valueid", force: :cascade do |t|
    t.float    "datavalue"
    t.datetime "utcdatetime",        null: false
    t.integer  "siteid",             null: false
    t.integer  "originalvariableid", null: false
    t.integer  "offsetvalue"
    t.integer  "offsettypeid"
    t.datetime "insertdate"
    t.index ["siteid"], name: "hourly_windspeeddatavalues_siteid_idx", using: :btree
    t.index ["utcdatetime", "siteid", "originalvariableid", "offsetvalue"], name: "hourly_windspeeddatavalues_utcdatetime_siteid_orignalvariableid", unique: true, using: :btree, comment: "added unique index"
  end

  create_table "imiqversion", id: false, force: :cascade do |t|
    t.string   "versionnumber",      limit: 50, null: false
    t.datetime "creationdate"
    t.text     "versiondescription"
  end

  create_table "incidents", primary_key: "incidentid", force: :cascade, comment: "Lists natural or anthropogenic incidents, that may have affected a site, data values or an instruments ability to collect data." do |t|
    t.integer  "siteid",                                  comment: "Integer identifier that references the record in the Sites table.  Enter a SiteID only when incident is relevant to the site."
    t.integer  "datastreamid",                            comment: "Integer identifier that references the record in the Datastreams table.  Enter a DatastreamID only when the incident is relevant to a particular sensor."
    t.datetime "starttime",                               comment: "When incident started -- note this does not refer to the measurement start time. "
    t.string   "startprecision", limit: 255,              comment: "Notes on how precise recorded incident start time is."
    t.datetime "endtime",                                 comment: "When incident ended -- note this does not necessarily refer to the measurement end time. "
    t.string   "endprecision",   limit: 255,              comment: "Notes on how precise recorded incident start time is."
    t.string   "type",           limit: 255, null: false, comment: "Type of incident that affected data collection or values. "
    t.text     "description",                             comment: "Detailed description of what happened (or what state equipment was found in\" and what measurements may have been affected"
    t.string   "reportedby",     limit: 96,               comment: "Person who reported incident."
    t.text     "comments",                                comment: "Comments on incident that are not covered elsewhere in the table. "
  end

  create_table "isometadata", primary_key: "metadataid", force: :cascade, comment: "The ISOMetadata table contains dataset and project level metadata required by the CUAHSI HIS metadata system (http://www.cuahsi.org/his/documentation.html) for compliance with standards such as the draft ISO 19115 or ISO 8601. The mandatory fields in this table must be populated to provide a complete set of ISO compliant metadata in the database." do |t|
    t.string "topiccategory",  limit: 255, default: "", null: false, comment: "Topic category keyword that gives the broad ISO19115 metadata topic category for data from this source. The controlled vocabulary of topic category keywords is given in the TopicCategoryCV table."
    t.string "title",          limit: 255, default: "", null: false, comment: "Title of data from a specific data source."
    t.text   "abstract",                                null: false, comment: "Abstract of data from a specific data source."
    t.string "profileversion", limit: 255, default: "", null: false, comment: "Name of metadata profile used by the data source"
    t.string "metadatalink",   limit: 500,                           comment: "Link to additional metadata reference material."
  end

  create_table "methods", primary_key: "methodid", force: :cascade, comment: "The Methods table lists the methods used to collect the data and any additional information about the method." do |t|
    t.string "methodname",        limit: 255, null: false, comment: "Name of method used."
    t.text   "methoddescription",             null: false, comment: "Description of each method."
    t.string "methodlink",        limit: 500,              comment: "Link to additional reference material on method."
    t.index ["methodname"], name: "methods_methodname", unique: true, using: :btree
  end

  create_table "monthly_discharge", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"monthly_discharge\" with the fields: valueid,datavalue,siteid,utcdatetime,originalvariableid and variableid.  Sets originalvariableid=689 and variableid=700." do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "monthly_discharge_siteid_idx", using: :btree
  end

  create_table "monthly_discharge_all", id: false, force: :cascade, comment: "This view creates monthly averages using \"daily_discharge\".  Restricted to months with at least 10 days of data." do |t|
    t.integer "siteid"
    t.float   "year"
    t.float   "month"
    t.float   "monthlyavg"
    t.bigint  "total"
    t.index ["siteid"], name: "monthly_discharge_all_siteid_idx", using: :btree
  end

  create_table "monthly_rh", primary_key: "valueid", id: :bigint, force: :cascade, comment: "This view creates \"monthly_rh\" with the fields: valueid,datavalue,siteid,utcdatetime,originalvariableid and variableid.  Sets originalvariableid=691 and variableid=707." do |t|
    t.float    "datavalue"
    t.integer  "siteid"
    t.datetime "utcdatetime"
    t.integer  "originalvariableid"
    t.integer  "variableid"
    t.index ["siteid"], name: "monthly_rh_siteid_idx", using: :btree
  end

  create_table "monthly_rh_all", id: false, force: :cascade do |t|
    t.integer "siteid", null: false
    t.integer "year"
    t.integer "month"
    t.float   "rh"
    t.float   "at"
    t.integer "total"
    t.index ["siteid"], name: "monthly_rh_all_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgairtemp", id: false, force: :cascade do |t|
    t.integer "siteid"
    t.float   "avgannual"
    t.bigint  "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgairtemp_siteid_idx", using: :btree
    t.index ["siteid"], name: "multiyear_annual_all_avgairtemp_siteid_idx2", using: :btree
  end

  create_table "multiyear_annual_all_avgdischarge", id: false, force: :cascade do |t|
    t.integer "siteid"
    t.float   "avgannual"
    t.bigint  "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgdischarge_siteid_idx", using: :btree
    t.index ["siteid"], name: "multiyear_annual_all_avgdischarge_siteid_idx2", using: :btree
  end

  create_table "multiyear_annual_all_avgfallairtemp", id: false, force: :cascade do |t|
    t.integer "siteid"
    t.float   "avgannual"
    t.bigint  "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgfallairtemp_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgfallprecip", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgfallprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgpeakdischarge", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgpeakdischarge_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgpeaksnowdepth", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgpeaksnowdepth_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgpeakswe", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgpeakswe_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgprecip", id: false, force: :cascade do |t|
    t.integer "siteid",         null: false
    t.float   "avgannualtotal"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgrh", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "rh"
    t.float   "at"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgrh_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgspringairtemp", id: false, force: :cascade do |t|
    t.integer "siteid"
    t.float   "avgannual"
    t.bigint  "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgspringairtemp_siteid_idx", using: :btree
    t.index ["siteid"], name: "multiyear_annual_all_avgspringairtemp_siteid_idx2", using: :btree
  end

  create_table "multiyear_annual_all_avgspringprecip", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgspringprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgsummerairtemp", id: false, force: :cascade do |t|
    t.integer "siteid"
    t.float   "avgannual"
    t.bigint  "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgsummerairtemp_siteid_idx", using: :btree
    t.index ["siteid"], name: "multiyear_annual_all_avgsummerairtemp_siteid_idx2", using: :btree
  end

  create_table "multiyear_annual_all_avgsummerdischarge", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgsummerdischarge_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgsummerprecip", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgsummerprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgsummerrh", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgsummerrh_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgwinterairtemp", id: false, force: :cascade do |t|
    t.integer "siteid"
    t.float   "avgannual"
    t.bigint  "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgwinterairtemp_siteid_idx", using: :btree
    t.index ["siteid"], name: "multiyear_annual_all_avgwinterairtemp_siteid_idx2", using: :btree
  end

  create_table "multiyear_annual_all_avgwinterprecip", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgwinterprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_all_avgwinterrh", id: false, force: :cascade do |t|
    t.integer "siteid",     null: false
    t.float   "avgannual"
    t.integer "totalyears"
    t.index ["siteid"], name: "multiyear_annual_all_avgwinterrh_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgairtemp", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgairtemp_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgdischarge", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgdischarge_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgfallairtemp", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgfallairtemp_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgfallprecip", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgfallprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgpeakdischarge", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgpeakdischarge_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgpeaksnowdepth", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgpeaksnowdepth_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgpeakswe", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgpeakswe_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgprecip", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgrh", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgrh_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgspringairtemp", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgspringairtemp_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgspringprecip", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgspringprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgsummerairtemp", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgsummerairtemp_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgsummerdischarge", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgsummerdischarge_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgsummerprecip", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgsummerprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgsummerrh", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgsummerrh_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgwinterairtemp", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgwinterairtemp_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgwinterprecip", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgwinterprecip_siteid_idx", using: :btree
  end

  create_table "multiyear_annual_avgwinterrh", primary_key: "valueid", id: :bigint, force: :cascade do |t|
    t.float    "datavalue"
    t.integer  "siteid",             null: false
    t.datetime "utcdatetime"
    t.integer  "originalvariableid", null: false
    t.integer  "variableid",         null: false
    t.index ["siteid"], name: "multiyear_annual_avgwinterrh_siteid_idx", using: :btree
  end

  create_table "networkdescriptions", primary_key: "networkid", id: :integer, comment: "Unique integer identifier that identifies a network.", force: :cascade do |t|
    t.string "networkcode",        limit: 50, null: false, comment: "Network code used by organization that collects the data."
    t.text   "networkdescription",            null: false, comment: "Full text description of the network."
  end

  create_table "nhd_huc8", id: :integer, default: -> { "nextval('nhd_huc8_id_seq1'::regclass)" }, force: :cascade do |t|
    t.bigint "gaz_id"
    t.float  "area_acres"
    t.float  "area_sqkm"
    t.string "states",      limit: 255
    t.date   "loaddate"
    t.string "huc_8",       limit: 255
    t.string "hu_8_name",   limit: 255
    t.float  "shape_leng"
    t.float  "shape_area"
    t.text   "geoposition"
  end

# Could not dump table "odmdatavalues" because of following StandardError
#   Unknown type 'public.geography' for column 'geographylocation'

  create_table "offsettypes", primary_key: "offsettypeid", force: :cascade, comment: "The OffsetTypes table lists full descriptive information for each of the measurement offsets." do |t|
    t.integer "offsetunitsid",     null: false, comment: "Integer identifier that references the record in the Units table giving the Units of the OffsetValue."
    t.text    "offsetdescription", null: false, comment: "Full text description of the offset type."
  end

  create_table "organizationdescriptions", primary_key: "organizationid", id: :integer, comment: "Unique integer identifier that identifies an organization.", force: :cascade, comment: "Organizations, which are associated with Sources." do |t|
    t.string "organizationcode",        limit: 50, null: false, comment: "Organization code used by organization that collects the data."
    t.text   "organizationdescription",            null: false, comment: "Full text description of the organization."
  end

  create_table "organizations", id: false, force: :cascade, comment: "Shows associations of a data source with multiple organizations. " do |t|
    t.integer "organizationid", null: false, comment: "Integer identifier that references the record in the OrganizationDescriptions table."
    t.integer "sourceid",       null: false, comment: "Integer identifier that references the record in the Sources table."
    t.integer "networkid"
  end

  create_table "processing", primary_key: "processingid", force: :cascade, comment: "The Processing table lists Qa/Qc that was done to the Sources, ISOMetadata and Sites tables.  It also lists any known data restrictions, priority of data entry and processing needs that need to be done." do |t|
    t.integer "sourceid",                     comment: "Integer identifier that references the record in the Sources table."
    t.integer "siteid",                       comment: "Integer identifier that references the record in the Sites table."
    t.integer "metadataid",                   comment: "Integer identifier that references the record in the ISOMetadata table."
    t.string  "datarestrictions", limit: 255, comment: "Any known restrictions on data "
    t.integer "datapriority",                 comment: "Priority level for data entry."
    t.text    "processingneeds",              comment: "What needs to be done to get the data entered"
    t.string  "qaqcperson",       limit: 255, comment: "Name of database team member who has performed the QaQc on a Sources, ISOMetadata or Sites record."
    t.text    "qaqccomments",                 comment: "Processing comments for QaQc data.  "
    t.date    "qaqcdate",                     comment: "Date that QaQc was performed."
  end

  create_table "qualifiers", primary_key: "qualifierid", force: :cascade, comment: "The Qualifiers table contains data qualifying comments that accompany the data." do |t|
    t.string "qualifiercode",        limit: 50,              comment: "Text code used by organization that collects the data."
    t.text   "qualifierdescription",            null: false, comment: "Text of the data qualifying comment."
  end

  create_table "qualitycontrollevels", primary_key: "qualitycontrollevelid", force: :cascade, comment: "The QualityControlLevels table contains the quality control levels that are used for versioning data within the database." do |t|
    t.string "qualitycontrollevelcode", limit: 50,  null: false, comment: "Code used to identify the level of quality control to which data values have been subjected."
    t.string "definition",              limit: 255, null: false, comment: "Definition of Quality Control Level."
    t.text   "explanation",                         null: false, comment: "Explanation of Quality Control Level"
  end

  create_table "rasterdatavalues", primary_key: "valueid", force: :cascade do |t|
    t.text     "datavalue"
    t.float    "valueaccuracy"
    t.datetime "localdatetime",            null: false
    t.float    "utcoffset",                null: false
    t.integer  "qualifierid"
    t.integer  "derivedfromid"
    t.integer  "datastreamid",             null: false
    t.string   "censorcode",    limit: 50
  end

  create_table "samplemediumcv", primary_key: "term", id: :string, limit: 255, force: :cascade do |t|
    t.text "definition"
  end

  create_table "siteattributes", id: false, force: :cascade, comment: "Lists site data values that are non-numeric." do |t|
    t.integer "siteid",                       null: false, comment: "Integer identifier that references the record in the Sites table."
    t.integer "attributeid",                  null: false, comment: "Integer identifier that references the record in the Attributes table."
    t.string  "attributevalue",   limit: 255, null: false, comment: "The non-numeric data value"
    t.text    "attributecomment",                          comment: "Attribute comment."
  end

  create_table "sites", primary_key: "siteid", force: :cascade, comment: "The Sites table provides information giving the spatial location at which data values have been collected." do |t|
    t.string   "sitecode",               limit: 50,  null: false, comment: "Code used by organization that collects the data to identify the site"
    t.string   "sitename",               limit: 255,              comment: "Full name of the sampling site."
    t.string   "spatialcharacteristics", limit: 50,  null: false, comment: "Indicates whether site is a point, polygon, linestring."
    t.integer  "sourceid",                           null: false, comment: "Integer identifier that references the record in the Sources table giving the source of the data value."
    t.string   "verticaldatum",          limit: 255,              comment: "Vertical datum of the elevation. Controlled Vocabulary from V erticalDatumCV ."
    t.integer  "localprojectionid",                               comment: "Identifier that references the Spatial Reference System of the local coordinates in the SpatialReferences table. This field is required if local coordinates are given."
    t.float    "posaccuracy_m",                                   comment: "Value giving the accuracy with which the positional information is specified in meters."
    t.string   "state",                  limit: 255,              comment: "Name of state in which the monitoring site is located."
    t.string   "county",                 limit: 255,              comment: "Name of county in which the monitoring site is located."
    t.text     "comments",                                        comment: "Comments related to the site."
    t.integer  "latlongdatumid",                     null: false, comment: "Identifier that references the Spatial Reference System of the latitude and longitude coordinates in the SpatialReferences table."
    t.text     "geolocation",                                     comment: "Coordinates and elevation given in a specific format for points and polygons.  Latitude and Longitude should be in decimal degrees. Elevation is in meters. If elevation is not provided it can be obtained programmatically from a DEM based on location information. Point locations are stored as \"Point (long lat elevation)\".  The following is an example for a polygon: \r\nPOLYGON (-146.34425083697045 69.688296227508985, -146.34308827446938 69.688355477509049,...) \r\n"
    t.text     "locationdescription",                             comment: "Description of site location"
    t.datetime "updated_at",                                      comment: "The timestamp that the record was last updated."
    t.index ["siteid"], name: "pk_sites_siteid", unique: true, using: :btree
  end

  create_table "sources", primary_key: "sourceid", force: :cascade, comment: "The Sources table lists the original sources of the data, providing information sufficient to retrieve and reconstruct the data value from the original data files if necessary." do |t|
    t.string   "organization",      limit: 255,              null: false, comment: "Name of the organization that collected the data. This should be the agency or organization that collected the data, even if it came out of a database consolidated from many sources such as STORET."
    t.text     "sourcedescription",                          null: false, comment: "Full text description of the source of the data."
    t.string   "sourcerole",        limit: 50,               null: false, comment: "If the source is an originator or publisher of data"
    t.string   "sourcelink",        limit: 500,                           comment: "Link that can be pointed at the original data file and/or associated metadata stored in the digital library or URL of data source."
    t.string   "contactname",       limit: 255, default: "", null: false, comment: "Name of the contact person for the data source."
    t.string   "phone",             limit: 255, default: "", null: false, comment: "Phone number for the contact person."
    t.string   "email",             limit: 255, default: "", null: false, comment: "Email address for the contact person."
    t.string   "address",           limit: 255, default: "", null: false, comment: "Street address for the contact person."
    t.string   "city",              limit: 255, default: "", null: false, comment: "City in which the contact person is located."
    t.string   "state",             limit: 255, default: "", null: false, comment: "State in which the contact person is located. Use two letter abbreviations for US. For other countries give the full country name."
    t.string   "zipcode",           limit: 255, default: "", null: false, comment: "US Zip Code or country postal code."
    t.text     "citation",                                   null: false, comment: "Text string that give the citation to be used when the data from each source are referenced."
    t.integer  "metadataid",                                 null: false, comment: "Integer identifier referencing the record in the ISOMetadata table for this source."
    t.datetime "updated_at",                                              comment: "The timestamp the source was last updated"
  end

  create_table "spatialreferences", primary_key: "spatialreferenceid", force: :cascade do |t|
    t.integer "srsid"
    t.string  "srsname",      limit: 255, null: false
    t.boolean "isgeographic"
    t.text    "notes"
  end

  create_table "speciationcv", primary_key: "term", id: :string, limit: 255, force: :cascade do |t|
    t.text "definition"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", force: :cascade do |t|
    t.string  "name",         limit: 128, null: false
    t.integer "principal_id",             null: false
    t.integer "version"
    t.binary  "definition"
    t.index ["name"], name: "sysdiagrams_name", unique: true, using: :btree
    t.index ["principal_id"], name: "sysdiagrams_principal_id", unique: true, using: :btree
  end

  create_table "topiccategorycv", primary_key: "term", id: :string, limit: 255, force: :cascade do |t|
    t.text "definition"
  end

  create_table "units", primary_key: "unitsid", force: :cascade do |t|
    t.string "unitsname",         limit: 255, null: false
    t.string "unitstype",         limit: 255, null: false
    t.string "unitsabbreviation", limit: 255, null: false
    t.index ["unitsid"], name: "pk_units_unitsid", unique: true, using: :btree
  end

  create_table "valuetypecv", primary_key: "term", id: :string, limit: 255, force: :cascade do |t|
    t.text "definition"
  end

  create_table "variablenamecv", primary_key: "term", id: :string, limit: 255, force: :cascade do |t|
    t.text "definition"
  end

  create_table "variables", primary_key: "variableid", force: :cascade, comment: "The Variables table lists the full descriptive information about what variables have been measured." do |t|
    t.string  "variablecode",        limit: 50,               null: false, comment: "Text code used by the organization that collects the data to identify the variable."
    t.string  "variablename",        limit: 255,              null: false, comment: "Full text name of the variable that was measured, observed, modeled, etc. This should be from the VariableNameCV controlled vocabulary table."
    t.text    "variabledescription",                                       comment: "A description of the variable"
    t.string  "speciation",          limit: 255, default: "", null: false, comment: "Text code used to identify how the data value is expressed (i.e., total phosphorus concentration expressed as P). This should be from the SpeciationCV controlled vocabulary table."
    t.integer "variableunitsid",                              null: false, comment: "Integer identifier that references the record in the Units table giving the units of the data values associated with the variable."
    t.string  "samplemedium",        limit: 255, default: "", null: false, comment: "The medium in which the sample or observation was taken or made. This should be from the SampleMediumCV controlled vocabulary table."
    t.string  "valuetype",           limit: 255, default: "", null: false, comment: "Text value indicating what type of data value is being recorded. This should be from the ValueTypeCV controlled vocabulary table."
    t.boolean "isregular",                                    null: false, comment: "Value that indicates whether the data values are from a regularly sampled time series."
    t.float   "timesupport",                                  null: false, comment: "Numerical value that indicates the time support (or temporal footprint) of the data values. 0 is used to indicate data values that are instantaneous. Other values indicate the time over which the data values are implicitly or explicitly averaged or aggregated."
    t.integer "timeunitsid",                                  null: false, comment: "Integer identifier that references the record in the Units table giving the Units of the time support. If TimeSupport is 0, indicating an instantaneous observation, a unit needs to still be given for completeness, although it is somewhat arbitrary."
    t.string  "datatype",            limit: 255, default: "", null: false, comment: "Text value that identifies the data values as one of several types from the DataTypeCV controlled vocabulary table."
    t.string  "generalcategory",     limit: 255, default: "", null: false, comment: "General category of the data values from the GeneralCategoryCV controlled vocabulary table."
    t.float   "nodatavalue",                                  null: false, comment: "Numeric value used to encode no data values for this variable."
    t.index ["variablecode"], name: "variables_variablecode", unique: true, using: :btree
    t.index ["variableid"], name: "pk_variables_variableid", unique: true, using: :btree
  end

  create_table "verticaldatumcv", primary_key: "term", id: :string, limit: 255, force: :cascade do |t|
    t.text "definition"
  end

  add_foreign_key "datavalues", "categories", column: "categoryid", primary_key: "categoryid", name: "fk_datavalues_categoryid"
  add_foreign_key "datavalues", "censorcodecv", column: "censorcode", primary_key: "term", name: "fk_datavalues_censorcodecv"
  add_foreign_key "datavalues", "datastreams", column: "datastreamid", primary_key: "datastreamid", name: "fk_datavalues_datastreamid"
  add_foreign_key "derivedfrom", "datavaluesraw", column: "valueid", primary_key: "valueid", name: "fk_derivedfrom_datavaluesraw"
  add_foreign_key "groups", "groupdescriptions", column: "groupid", primary_key: "groupid", name: "fk_groups_groupdescriptions"
  add_foreign_key "incidents", "datastreams", column: "datastreamid", primary_key: "datastreamid", name: "fk_incidents_datastreams"
  add_foreign_key "organizations", "organizationdescriptions", column: "organizationid", primary_key: "organizationid", name: "fk_organizations_organizationid"
  add_foreign_key "rasterdatavalues", "qualifiers", column: "qualifierid", primary_key: "qualifierid", name: "fk_rasterdatavalues_qualifierid"
  add_foreign_key "siteattributes", "attributes", column: "attributeid", primary_key: "attributeid", name: "fk_siteattributes_attributeid"
  add_foreign_key "variables", "datatypecv", column: "datatype", primary_key: "term", name: "fk_variables_datatypecv"
  add_foreign_key "variables", "samplemediumcv", column: "samplemedium", primary_key: "term", name: "fk_variables_samplemediumcv"
  add_foreign_key "variables", "speciationcv", column: "speciation", primary_key: "term", name: "fk_variables_speciationcv"
  add_foreign_key "variables", "units", column: "timeunitsid", primary_key: "unitsid", name: "fk_variables_timeunitsid"
  add_foreign_key "variables", "units", column: "variableunitsid", primary_key: "unitsid", name: "fk_variables_variableunitsid"
  add_foreign_key "variables", "valuetypecv", column: "valuetype", primary_key: "term", name: "fk_variables_valuetypecv"
  add_foreign_key "variables", "variablenamecv", column: "variablename", primary_key: "term", name: "fk_variables_variablenamecv"
end
