class SitesController < ApplicationController
  respond_to :geojson, :json
  set_pagination_headers :sites, only: [:index]

  # Fetch & Show all of the site records using the api_params
  # [GET] /sites.json => sites#index
  # def index

  def index
    @search = Site.search do
      fulltext api_params[:q] if api_params[:q].present?

      with :has_data, true
      with :has_location, true
      # with :geomtype, 'Point'

      if api_params[:variablenames].present? and api_params[:time_step].present?
        with :timestep_variables, api_params[:variablenames].collect { |name| "#{api_params[:time_step]}-#{name}"}
      elsif api_params[:variablenames].present?
        with :derived_variables, api_params[:variablenames]
      elsif api_params[:time_step].present?
        with :timesteps, api_params[:time_step]
      end

      with :networkcodes, api_params[:networkcode] if api_params[:networkcode].present?
      with :organizationcodes, api_params[:organizationcode] if api_params[:organizationcode].present?
      with :generalcategories, api_params[:generalcategory] if api_params[:generalcategory].present?
      with(:location).in_bounding_box(*api_params[:bounds]) if api_params[:bounds].present?
      paginate page: api_params[:page], per_page: api_params[:limit]
    end

    @sites = @search.results

    respond_with @sites
  end

  def downloads
    @site = Site.find(params[:id])

    respond_with(@site)
  end

  # Fetch & Show an individual site record
  # [GET] /sites/1.json
  # [GET] /sites/1.html
  def show
    @site = Site.find(params[:id])

    respond_with @site
  end

  #
  # def update
  #   @site = Site.find(params[:id])
  #
  #   @site.update_attributes(params[:site])
  # end

  protected

  def api_params
    api_request = params.permit(:limit, :page, :geometry, :variablenames, :variablename, :datatype, :samplemedium,
                  :valuetype, :generalcategory, :networkcode, :organizationcode, :q, :time_step, bounds: [:sw_lat, :sw_lng, :ne_lat, :ne_lng])

    api_request[:variablenames] ||= []
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i

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
