module DerivedValuesApiConcern
  extend ActiveSupport::Concern

  TITLE = {
    title: "Export",
    description: "
The export endpoint accesses summary-products in the Imiq Hydroclimate Database and builds a .csv file for download.
The timestep and the summary-product data field are declared in the URL. "

  }

  API = {
    '/export/{timestep}_{field}.{format}?{query}' => {
      description: "

Export \"field\" value descriptions:

* airtemp       - air temperature at surface height of 2 m
* discharge     - river/stream discharge
* precip        - accumulated precipitation
* rh            - relative humidity at the surface height of 2 m
* snowdepth     - accumulated snow depth
* swe           - snow water equivalent
* watertemp     - temperature of lakes, etc at the surface
* winddirection - wind direction near surface
* windspeed     - wind direction near surface
      ",
      url: "http://imiq-api.gina.alaska.edu/export/daily_airtemp.csv?siteids=3201&startdate=19940601&enddate=19940731",
      response: "A .csv file will be downloaded to your computer.",
      url_params: [
        {
          name: 'timestep',
          required: true,
          values: %w{ fifteenmin hourly daily monthly annual }
        },
        {
          name: 'field',
          required: true,
          values: %w{ airtemp discharge precip rh snowdepth swe watertemp winddirection windspeed }

        },
        {
          name: 'format',
          required: false,
          values: %w{ csv json },
          default: 'csv'
        }
      ],
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
