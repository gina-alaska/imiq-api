class DailyValuesController < ApplicationController
  def values
    search_dailyvalues model_for(params[:field]), params[:field]
  end
  
  protected

  def model_for(field)
    FIELD_MODELS[field.to_s]
  end

  def search_dailyvalues(model, field)
    @dailyvalues_csv_header = model.csv_header   
    @dailyvalues = model.order('utcdatetime ASC').has_data
    if api_params[:startdate].present?
      @dailyvalues = @dailyvalues.where("utcdatetime >= ?",Date.parse(params[:startdate]).beginning_of_day)
    end
    
    if api_params[:enddate].present?
      @dailyvalues = @dailyvalues.where("utcdatetime <= ?",Date.parse(params[:enddate]).end_of_day)
    end
  
    if api_params[:siteid].present?
      @dailyvalues = @dailyvalues.where(siteid: params[:siteid])
      siteids = [params[:siteid]]
    else
      siteids = @dailyvalues.pluck(:siteid)
    end
    @sites = Site.where(siteid: siteids).uniq
    @dailyvalues = @dailyvalues.order(:siteid)
    
    filename_parts = ['Imiq']
    if api_params[:siteid].present?
      filename_parts << "site-#{api_params[:siteid]}"
    end
    
    filename_parts += [field, Time.now.strftime("%Y%m%d-%H%M%S")]
    
    respond_to do |format|
      format.csv { 
        filename = "#{filename_parts.join('_')}.csv"
        headers["Content-type"] = "text/csv"
        headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
        render 'daily_values'
      }
    end
  end
  
  def api_params
    api_request = params.permit(:limit, :page, :siteid, :startdate, :enddate)
    
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i
    
    api_request
  end
#  helper_method :api_params

end
