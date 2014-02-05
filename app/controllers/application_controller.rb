class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  FIELD_MODELS = { 
    'air_temp' => DailyAirtempdatavalue,
    'relative_humidity' => DailyRhdatavalue,
    'precipitation' => DailyPrecipdatavalue,
    'discharge' => DailyDischargedatavalue,
    'snow_depth' => DailySnowdepthdatavalue,
    'snow_water_equivalent' => DailySwedatavalue,
    'wind_speed' => DailyWindspeeddatavalue,
    'wind_direction' => DailyWinddirectiondatavalue    
  }  
  
  protected
    def self.set_pagination_headers(name, options = {})
      after_filter(options) do |controller|
        url = request.original_url.sub(/\?.*$/, '')
        results = instance_variable_get("@#{name}")
        links = { prev: '', next: '' }
        
        if results.previous_page
          links[:prev] = "#{url}?#{request.query_parameters.merge({ :page => results.previous_page }).to_param}"
        end
        if results.next_page
          links[:next] =  "#{url}?#{request.query_parameters.merge({ :page => results.next_page }).to_param}"
        end
        
        headers["Access-Control-Expose-Headers"] = 'X-Next-Link,X-Previous-Link,X-Records-Offset,X-Page,X-Total-Pages,X-Total-Records'
        headers["Access-Control-Allow-Origin"] = '*'
        headers["X-Total-Records"] = results.total_entries.to_s
        headers["X-Total-Pages"] = results.total_pages.to_s
        headers["X-Page"] = results.current_page.to_s
        headers["X-Records-Offset"] = (results.offset + (results.length)).to_s
        headers["X-Previous-Link"] = links[:prev].to_s
        headers["X-Next-Link"] = links[:next].to_s
      end
    end
end
