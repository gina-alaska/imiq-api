class SitesController < ApplicationController
  respond_to :geojson, :json
  set_pagination_headers :sites, only: [:index]
  
  # Fetch & Show all of the site records using the api_params
  # [GET] /sites.json => sites#index
  # def index
#     @sites = Site.has_location.uniq
#     @sites = @sites.geomtype(api_params[:geometry]) if api_params[:geometry].present?
#     
#     if api_params[:variablename].present?
#       @sites = @sites.joins(:variables).where('variables.variablename ilike ?', "#{api_params[:variablename]}%")
#     end
#     
#     if api_params[:datatype].present?
#       @sites = @sites.joins(:variables).where('variables.datatype ilike ?', "#{api_params[:datatype]}%" )
#     end
#     
#     if api_params[:samplemedium].present?
#       @sites = @sites.joins(:variables).where('variables.samplemedium ilike ?', "#{api_params[:samplemedium]}%" )
#     end
#     
#     if api_params[:valuetype].present?
#       @sites = @sites.joins(:variables).where('variables.valuetype ilike ?', "#{api_params[:valuetype]}%" )
#     end
#     
#     if api_params[:generalcategory].present?
#       @sites = @sites.joins(:variables).where('variables.generalcategory ilike ?', "#{api_params[:generalcategory]}%" )
#     end
#     
#     if api_params[:organizationcode].present?
#       @sites = @sites.joins(:organizations).where('organizationcode ilike ?', api_params[:organizationcode])
#     end
# 
#     site_ids = []
#     if api_params[:derived_values].present? and Site::DERIVED_VARIABLES[api_params[:derived_values]].present?
#       site_ids += Site::DERIVED_VARIABLES[api_params[:derived_values]].to_s.classify.constantize.uniq.pluck(:siteid)
#     end
#     
#     site_ids.uniq!
#     if site_ids.count > 0
#       @sites = @sites.where(siteid: site_ids)
#     end
#     
#     @sites = @sites.paginate(:page => params[:page], :per_page => api_params[:limit])
#     
#     respond_with @sites
#   end

  def index
    @search = Site.search do
      fulltext api_params[:q] if api_params[:q].present?
      
      with :has_data, true
      with :has_location, true
      # with :geomtype, 'Point'
      with :variablenames, api_params[:variablename] if api_params[:variablename].present?
      with :organizationcodes, api_params[:organizationcode] if api_params[:organizationcode].present?
      with :generalcategories, api_params[:generalcategory] if api_params[:generalcategory].present?
      with :derived_variables, api_params[:derived_values] if api_params[:derived_values].present?
      with(:location).in_bounding_box(*api_params[:bounds]) if api_params[:bounds].present?
      paginate page: api_params[:page], per_page: api_params[:limit]
    end
    
    @sites = @search.results
    
    respond_with @sites
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
    api_request = params.permit(:limit, :page, :geometry, :variablename, :datatype, :samplemedium,
                  :valuetype, :generalcategory, :organizationcode, :derived_values, :bounds, :q)
                                
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i
    if api_request[:bounds].present?
      bounds = api_request[:bounds].split(',')
      api_request[:bounds] = [[bounds[1],bounds[0]], [bounds[3], bounds[2]]]
    end
    
    api_request
  end
  helper_method :api_params
end
