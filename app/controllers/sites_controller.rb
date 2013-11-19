class SitesController < ApplicationController
  def index
    @sites = Site.limit(api_params[:limit])
    
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
    api_request = params.permit(:limit)
    
    api_request[:limit] ||= 50
    
    api_request
  end
end
