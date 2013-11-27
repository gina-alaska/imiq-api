class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  protected
    def self.set_pagination_headers(name, options = {})
      after_filter(options) do |controller|
        url = request.original_url.sub(/\?.*$/, '')
        results = instance_variable_get("@#{name}")
        links = { prev: false, next: false }
        
        if results.previous_page
          links[:prev] = "#{url}?#{request.query_parameters.merge({ :page => results.previous_page }).to_param}"
        end
        if results.next_page
          links[:next] =  "#{url}?#{request.query_parameters.merge({ :page => results.next_page }).to_param}"
        end
        
        headers["Access-Control-Expose-Headers"] = 'Links'
        headers["Access-Control-Allow-Origin"] = '*'
        headers["Links"] = {
          total: results.total_entries,
          total_pages: results.total_pages,
          page: results.current_page,
          offset: results.offset + results.per_page,
          previous_page: links[:prev],
          next_page: links[:next]
        }.to_json
      end
    end
end
