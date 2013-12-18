class DailyValuesController < ApplicationController
  def airtemps
  
    @dailyairtempdatavalues = DailyAirtempdatavalue.order('utcdatetime ASC').has_data
    
    if api_params[:siteid].present?
      @dailyairtempdatavalues = @dailyairtempdatavalues.where(siteid: params[:siteid])
    end
    
    if api_params[:startdate].present?
      @dailyairtempdatavalues = @dailyairtempdatavalues.where("utcdatetime >= ?",Date.parse(params[:startdate]).beginning_of_day)
    end
    
    if api_params[:enddate].present?
      @dailyairtempdatavalues = @dailyairtempdatavalues.where("utcdatetime <= ?",Date.parse(params[:enddate]).end_of_day)
    end
    
    respond_to do |format|
      #format.html
      format.csv { render layout: false }
    end
    
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
