class DerivedValuesController < ApplicationController
  def index
    # params[:field], params[:timestep]
    model = get_model(api_params[:field], api_params[:timestep])
    
    @sites = []
    @values = []
    @site_names = []
    
    if model.nil?
      flash.now[:error] = "Invalid field (#{api_params[:field]}) or timestep (#{api_params[:timestep]}) params given"
    else
      # @values_csv_header = model.csv_header   
      @values = model.order('utcdatetime ASC').has_data
      if api_params[:startdate].present?
        @values = @values.where("utcdatetime >= ?",Date.parse(api_params[:startdate]).beginning_of_day)
      end
    
      if api_params[:enddate].present?
        @values = @values.where("utcdatetime <= ?",Date.parse(api_params[:enddate]).end_of_day)
      end
  
      if api_params[:siteid].present?
        @values = @values.where(siteid: api_params[:siteid])
        siteids = [api_params[:siteid]]
      else
        siteids = @values.pluck(:siteid)
      end
      
      @sites = Site.where(siteid: siteids).uniq
      @values = @values.order(:siteid)
      @site_names = @sites.pluck(:sitename)      
    end

    
    filename_parts = ['Imiq']
    if api_params[:siteid].present?
      filename_parts << "site-#{api_params[:siteid]}"
    end
    
    filename_parts += [api_params[:timestep], api_params[:field], Time.now.strftime("%Y%m%d-%H%M%S")]
    
    respond_to do |format|
      format.csv { 
        filename = "#{filename_parts.join('_')}.csv"
        headers["Content-type"] = "text/csv"
        headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""          
      }
    end    
  end
  
  protected
  
  def api_params
    api_request = params.permit(:limit, :page, :siteid, :startdate, :enddate, :field, :timestep)
    
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i
    
    api_request
  end
  
  def get_model(field, timestep)
    FIELD_MODELS_ALL[timestep].try(:[], field)
  end
end
