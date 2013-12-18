class DailyValuesController < ApplicationController
  def airtemps
    
    @exportvalues = DailyAirtempdatavalue.order('utcdatetime ASC').has_data
    
    if api_params[:siteid].present?
      @exportvalues = @exportvalues.where(siteid: params[:siteid])
    end

    if api_params[:startdate].present?
      @exportvalues = @exportvalues.where("utcdatetime >= ?",Date.parse(params[:startdate]).beginning_of_day)
    end
    
    if api_params[:enddate].present?
      @exportvalues = @exportvalues.where("utcdatetime <= ?",Date.parse(params[:enddate]).end_of_day)
    end
    
    respond_to do |format|
      #format.html
      @unit_csv_header = DailyAirtempdatavalue.csv_header
      format.csv { render layout: false }
    end
    
  end
  
  def search_export
    
  end
  
  protected
  
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
