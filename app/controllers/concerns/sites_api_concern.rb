module SitesApiConcern
  extend ActiveSupport::Concern
  
  TITLE = {
    title: "Sites",
    description: "The sites endpoint provides a list of locations/descriptions where data values in the Imiq database were sampled."
  }
  
  API = {
    '/sites.{format}?{query}' => {
      description: "Parse list of data sources within Imiq. Restricted to those sites that have summary data products available for immediate export.",
      url: "http://imiq-api.gina.alaska.edu/sites.json",
      url_params: [
        {
          name: 'format',
          required: true,
          values: %w{ geojson,json,pdf }
          }],
      api_params: [
      {
        name: 'bounds', 
        description: 'select sites within geographic bounding box; use percent encoding to define bounds=[ne_lat],bounds=[sw_lat],bounds=[ne_lon],bounds=[sw_lon])', 
        type: 'integer', 
        default: '50',
        required: false    
      },
      { 
        name: 'limit', 
        description: 'number of site records to be retrieved per page', 
        type: 'integer', 
        default: '50',
        required: false 
      }, 
      { 
        name: 'page', 
        description: 'division of sites into sections (using limit to define number per section)', 
        type: 'integer', 
        default: '1',
        required: false 
      },
      {
        name: 'networkcode', 
        description: 'select sites by networkcode (i.e. RAWS, SNOTEL, NCDC ISH, etc.)', 
        type: 'string', 
        default: '',
        required: false         
      },
      {
        name: 'organizationcode', 
        description: 'select sites by organizationcode (i.e. NOAA, UAF, USFWS, etc.)', 
        type: 'string', 
        default: '',
        required: false          
      },
      {
        name: 'siteids', 
        description: 'select sites by siteids; use a list query siteids=1,2', 
        type: 'integer', 
        default: '',
        required: false         
      },
      {
        name: 'variablename', 
        description: 'select sites by variablename (i.e. airtemp, rh, watertemp, etc., see /sites/variables endpoint)', 
        type: 'string', 
        default: '',
        required: false        
      }
    ],
      response: "
[
{
url: http://192.168.222.226/sites/907
siteid: 907
sitecode: UAF_WERC_DFM1
sitename: DFM1 South White Hills Met 
spatialcharacteristics: POINT
sourceid: 29
verticaldatum: Unknown
localprojectionid: null
posaccuracy_m: null
state: AK
county: North Slope Borough
comments: Met
latlongdatumid: 3
geolocation: POINT (-149.558 69.201 293)
locationdescription: Updated, WERC HV5 snowsurvey site. Elevation from hand-held GPS
updated_at: 2014-08-25T14:52:03.440Z
lat: 69.201
lng: -149.558
elevation: 293
begin_date: 2006-07-16
end_date: 2011-03-14
source: {
sourceid: 29
organization: University of Alaska Fairbanks, Water and Environmental Research Center
sourcedescription: Climate and hydrology data collected on the North Slope (Umiat corridor) of Alaska listed on UAF INE WERC website
sourcerole: originator and funder
sourcelink: http://ine.uaf.edu/werc/projects/umiat_corridor/stations.html
contactname: Bill Schnabel
phone: (907) 474-7789
email: weschnabel@alaska.edu
address: Institue of Northern Engineering, 525 Duckering Building, PO Box 755910
city: Fairbanks
state: Alaska
zipcode: 99775-5910
citation: Water and Environmental Research Center, Institute of Northern Engineering, University of Alaska Fairbanks. Umiat Corridor Hydrology Study. [date of retrieval]
metadataid: 25
updated_at: 2014-08-25T14:52:46.403Z
}
datastreams: [
South White Hills Met_DFM1_AT_Avg 2m
South White Hills Met_DFM1_RH_Avg2m
South White Hills Met_DFM1_WindSpeed3m
South White Hills Met_DFM1_WindDir3m
South White Hills Met_DFM1_Precip
South White Hills Met_DFM1_NetRad_Avg
South White Hills Met_DFM1_SnowDepth_Avg
South White Hills Met_DFM1_Soil_Surface_Temperature_Rep_1
South White Hills Met_DFM1_Soil_Surface_Temperature_Rep_2
South White Hills Met_DFM1_Soil_Surface_Temperature_Rep_3
South White Hills Met_DFM1_XXX-cm_Depth_Soil_Temperature
South White Hills Met_DFM1_XX-cm_Depth_Soil_Water_Content
]
networks: [
WERC-UMIAT
]
derived_variables: {
daily: [
[
Air temperature
daily_airtemp
]
[
Precipitation
daily_precip
]
[
Relative humidity
daily_rh
]
[
Snow depth
daily_snowdepth
]
[
Wind direction
daily_winddirection
]
[
Wind speed
daily_windspeed
]
]
hourly: [
[
Air temperature
hourly_airtemp
]
[
Precipitation
hourly_precip
]
[
Relative humidity
hourly_rh
]
[
Snow depth
hourly_snowdepth
]
[
Wind direction
hourly_winddirection
]
[
Wind speed
hourly_windspeed
]
]
source: [
[
Humidity
source_air_humidity
]
[
Radiation, Longwave/Shortwave
source_air_radiation_lwsw
]
[
Temperature, Air
source_air_temperature
]
[
Wind, Direction/Speed
source_air_wind
]
[
Snow Depth
source_snow_depth
]
[
Soil Temperature
source_soil_temperature
]
[
Soil Water Content
source_soil_water_content
]
]
}
variables: [
Snow depth
Relative humidity
Temperature
Wind speed
Wind direction
Precipitation
Radiation, net
Water content
]
}
"
    },
    '/sites/{siteid}.{format}}' => {
      description: "Individual foos",
      url: "http://imiq-api.gina.alaska.edu/sites/1.json",
      url_params: [
        {
          name: 'siteid',
          required: true,
          values: %w{ integer }
          },
        {
          name: 'format',
          required: true,
          values: %w{ geojson,json,pdf }
          },
        ],     
      api_params: [],
      response: 
"
{
url: http://192.168.222.226/sites/10260
siteid: 10260
sitecode: AALC
sitename: Alcan Hwy MI-1244
spatialcharacteristics: POINT
sourceid: 215
verticaldatum: Unknown
localprojectionid: null
posaccuracy_m: null
state: ALASKA
county: null
comments: AGENCY:FWS NESSID:12614702 NWSID:500726
latlongdatumid: 3
geolocation: POINT(-141.466667 62.816667 548.64)
locationdescription: null
updated_at: 2014-08-25T14:52:03.440Z
lat: 62.816667
lng: -141.466667
elevation: 548.64
begin_date: 1990-06-01
end_date: 2013-04-30
source: {
sourceid: 215
organization: Western Regional Climate Center, Fish and Wildlife Service
sourcedescription: Remote Automated Weather Station Network (RAWS) data for Alaska's U.S. Fish and Wildlife Service stations
sourcerole: Publisher (WRCC), originator (USFWS)
sourcelink: http://www.raws.dri.edu/index.html
contactname: Unknown
phone: 775-674-7010
email:  wrcc@dri.edu
address: 2215 Raggio Parkway
city: Reno
state: NV
zipcode: 89512-1095
citation: Alaska, Western Regional Climate Center, 2013.Web. April 21,2013.http://www.raws.dri.edu/akF.html 
metadataid: 0
updated_at: 2014-08-25T14:52:46.403Z
}
datastreams: [
Alcan Hwy MI-1244_SolarRadiation
Alcan Hwy MI-1244_AvgWindSpeed
Alcan Hwy MI-1244_WindDirectionVector
Alcan Hwy MI-1244_WindSpeedGust
Alcan Hwy MI-1244_AvgAirTemperature
Alcan Hwy MI-1244_MaxAirTemperature
Alcan Hwy MI-1244_MinAirTemperature
Alcan Hwy MI-1244_AvgRelativeHumidity
Alcan Hwy MI-1244_MaxRelativeHumidity
Alcan Hwy MI-1244_MinRelativeHumidity
Alcan Hwy MI-1244_TotalPrecipitation
Alcan Hwy MI-1244_AvgSoilTemperature
Alcan Hwy MI-1244_MaxSoilTemperature
Alcan Hwy MI-1244_MinSoilTemperature
Alcan Hwy MI-1244_SolarRadiation
Alcan Hwy MI-1244_AvgAirTemperature
Alcan Hwy MI-1244_MaxAirTemperature
Alcan Hwy MI-1244_MinAirTemperature
Alcan Hwy MI-1244_BarometricPressure
Alcan Hwy MI-1244_Precip
Alcan Hwy MI-1244_AvgRelativeHumidity
Alcan Hwy MI-1244_MaxRelativeHumidity
Alcan Hwy MI-1244_MinRelativeHumidity
Alcan Hwy MI-1244_WindDirection
Alcan Hwy MI-1244_WindSpeedGust
Alcan Hwy MI-1244_AvgWindSpeed
]
networks: [
RAWS
]
derived_variables: {
daily: [
[
Air temperature
daily_airtemp
]
[
Precipitation
daily_precip
]
[
Relative humidity
daily_rh
]
[
Wind direction
daily_winddirection
]
[
Wind speed
daily_windspeed
]
]
hourly: [ ]
source: [
[
Barometric Pressure
source_air_barometric_pressure
]
[
Humidity
source_air_humidity
]
[
Radiation, Longwave/Shortwave
source_air_radiation_lwsw
]
[
Temperature, Air
source_air_temperature
]
[
Wind, Direction/Speed
source_air_wind
]
[
Soil Temperature
source_soil_temperature
]
]
}
variables: [
Radiation, incoming shortwave
Wind speed
Wind direction
Temperature
Relative humidity
Barometric pressure
Precipitation
]
}
"        
    } 
  }
end