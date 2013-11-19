class SitesController < ApplicationController
  def index
    @sites = Site.limit(api_params[:limit]).offset(api_params[:start])
    
    respond_to do |format|
      format.html
      format.json {
        render json: @sites.as_json(
          include: { 
            source: {
              except: [:sourceid]
            } 
          }, 
          except: [:sourceid]
        )
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
    api_request = params.permit(:limit, :page)
    
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i
    
    api_request
  end
end
