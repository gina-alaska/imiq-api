class SourcesController < ApplicationController
  respond_to :json
  
  def index
    @sources = Source.limit(api_params[:limit]).offset(api_params[:start])
    
#    respond_to do |format|
#      format.html
#      format.json {
#        render json: @sources
#      }
#    end
      respond_with :sources 

  end
  
  # Fetch & Show an individual site record
  # [GET] /sources/1.json
  # [GET] /sources/1.html 
  def show
    @source = Source.find(params[:id])
    
#    respond_to do |format|
#      format.html
#      format.json {
#        render json: @source
#      }
#    end
    respond_with :source
  end
  
  # 
  # def update
  #   @souce = Source.find(params[:id])
  #   
  #   @source.update_attributes(params[:site])
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
