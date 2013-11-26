class SitesController < ApplicationController
  # Fetch & Show all of the site records using the api_params
  # [GET] /sites.json => sites#index
  def index
    @sites = Site.has_location
    @sites = @sites.geomtype(api_params[:geometry]) if api_params[:geometry].present?
    @sites = @sites.limit(api_params[:limit]).offset(api_params[:start])
    
    respond_to do |format|
      format.html
      format.json {
        render json: @sites, callback: params[:callback]
      }
      format.geojson
    end
  end
  
  # Fetch & Show an individual site record
  # [GET] /sites/1.json
  # [GET] /sites/1.html 
  def show
    @site = Site.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json {
        render json: @site
      }
    end
  end
  
  # 
  # def update
  #   @site = Site.find(params[:id])
  #   
  #   @site.update_attributes(params[:site])
  # end
  
  protected
  
  def api_params
    api_request = params.permit(:limit, :page, :geometry)
    
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i
    
    api_request
  end
  helper_method :api_params
end
