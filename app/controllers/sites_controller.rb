class SitesController < ApplicationController
  include SitesApiConcern
  respond_to :geojson, :json
  
  # before_action :set_cors_headers, only: [:index,:show,:list,:variables]
  set_pagination_headers :sites, only: [:index, :show]

  # Fetch & Show all of the site records using the api_params
  # [GET] /sites.json => sites#index
  # def index

  def index
    @sites = site_search.results
    respond_to do |format| 
      format.json 
      format.geojson
      format.pdf {
        render pdf: 'Imiq_Site_List', layout: 'pdf.html'
      }
    end
  end

  def variables
    @search = site_search

    @available_variables = @search.facet(:derived_variables).rows.map(&:value).sort

    respond_to do |format|
      format.json {
        render json: {
          available_variables: @available_variables
        }
      }
    end
  end

  def list
    @sites = site_search(100000).results
    
    respond_to do |format|
      format.html
      format.pdf {
        render pdf: 'Imiq_Site_List', layout: 'pdf.html'
      }
      
      format.rtf {
        filename = "Imiq_Site_List.rtf"
        headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""        
        render 'list.txt'
      }
      format.txt {
        filename = "Imiq_Site_List.txt"
        headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
      }
    end
  end

  # Fetch & Show an individual site record
  # [GET] /sites/1.json
  # [GET] /sites/1.html
  def show
    @site = Site.find(params[:id])
    
    respond_to do |format|
      format.html { render layout: false }
      format.json
      format.geojson
    end
  end

  #
  # def update
  #   @site = Site.find(params[:id])
  #
  #   @site.update_attributes(params[:site])
  # end

  protected

  def site_search(limit = nil)
    Rails.logger.info api_params.inspect
    
    Site.search(include: [:networks, :organizations, :datastreams]) do
      fulltext api_params[:q] if api_params[:q].present?

      with :has_data, true
      with :has_location, true
      # with :geomtype, 'Point'

      if api_params[:variablenames].present? and api_params[:time_step].present?
        with :timestep_variables, api_params[:variablenames].collect { |name| "#{api_params[:time_step]}_#{name}"}
      elsif api_params[:variablenames].present?
        with :derived_variables, api_params[:variablenames]
      elsif api_params[:time_step].present?
        with :timesteps, api_params[:time_step]
      end
      
      order_by(api_params[:order]) if api_params[:order].present?

      with :siteid, api_params[:siteids] if api_params[:siteids].present?
      with :networkcodes, api_params[:networkcode] if api_params[:networkcode].present?
      with :organizationcodes, api_params[:organizationcode] if api_params[:organizationcode].present?
      with :generalcategories, api_params[:generalcategory] if api_params[:generalcategory].present?
      with(:location).in_bounding_box(*api_params[:bounds]) if api_params[:bounds].present?
      facet :derived_variables
      paginate page: api_params[:page], per_page: api_params[:limit] || limit
    end
  end

  def api_params
    api_request = params.permit(:limit, :page, :geometry, :variablenames, :variablename, :datatype, :samplemedium, :siteids,
                  :valuetype, :generalcategory, :networkcode, :organizationcode, :q, :time_step, :order, bounds: [:sw_lat, :sw_lng, :ne_lat, :ne_lng])

    api_request[:variablenames] ||= []
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i
    api_request[:siteids] = api_request[:siteids].split(',') if api_request[:siteids].present?
    
    if api_request[:bounds].present?
      bounds = api_request.delete(:bounds)

      coord_count = 0
      %w{ sw_lat sw_lng ne_lat ne_lng }.each do |coord|
        coord_count += 1 unless bounds[coord.to_sym].to_f == 0.0
      end

      if coord_count == 4
        api_request[:bounds] = [[bounds[:sw_lat],bounds[:sw_lng]], [bounds[:ne_lat], bounds[:ne_lng]]]
      end
    end

    if api_request[:variablename].present?
      api_request[:variablenames] << api_request[:variablename]
    end

    api_request
  end
  helper_method :api_params
end
