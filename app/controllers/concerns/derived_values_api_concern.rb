module DerivedValuesApiConcern
  extend ActiveSupport::Concern

  TITLE = {
    title: "Export",
    description: "The export endpoint accesses summary-products in the Imiq Hydroclimate Database and builds a .csv file for download. 
    The timestep and the summary-product data field are declared in the URL. Choices for timestep are: hourly, daily, monthly, annual.  
    Choices for summary-products fields are (with an informational description given in the parentheses): 
    airtemp (air temperature at surface height of 2 m), discharge (river/stream discharge), precip (accumulated precipitation), 
    rh (relative humidity at the surface height of 2 m), snowdepth (accumulated snow depth), swe (snow water equivalent), 
    watertemp (temperature of lakes, etc at the surface), winddirection (wind direction near surface), 
    windspeed (wind direction near surface)."
  }
  
  API = {
    '/export/"timestep"_"field".csv' => {
      description: "Export data with a given timestep and datafield.",
      url: "http://imiq-api.gina.alaska.edu/export/daily_airtemp.csv?siteids=3201&startdate=19940601&enddate=19940731",
      response: "A .csv file will be downloaded to your computer.",
      api_params: [
        {
          name: 'siteid', 
          description: 'unique siteid as identified on the map or from a site list', 
          type: 'integer', 
          default: 'none',
          required: false    
        },
        { 
          name: 'siteids', 
          description: 'comma-separated list of unique siteids as identified on the map or from a site list', 
          type: 'integer', 
          default: 'none',
          required: false 
        },
        {
          name: 'startdate', 
          description: 'start date for data, format=YYYYMMDD (i.e. 19940601)', 
          type: 'datetime', 
          default: 'none',
          required: false    
        },
        { 
          name: 'enddate', 
          description: 'start date for data, format=YYYYMMDD (i.e. 19940731)', 
          type: 'datetime', 
          default: 'none',
          required: false 
        },
      ],
   }
 }
end