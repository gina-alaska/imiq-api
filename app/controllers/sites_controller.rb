class SitesController < ApplicationController
  def index
    @sites = Site.all
    
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
end
