class DailyValuesController < ApplicationController
  def airtemps
    
    @dailyvalues = DailyAirtempdatavalue.order('utcdatetime ASC').has_data
    @dailyvalues_csv_header = DailyAirtempdatavalue.csv_header    
    
    search_dailyvalues
    
    respond_to do |format|
      format.csv { render 'daily_values/daily_values' }
    end
    
  end
  
  def rhs
    
    @dailyvalues = DailyRhdatavalue.order('utcdatetime ASC').has_data
    @dailyvalues_csv_header = DailyRhdatavalue.csv_header
    
    search_dailyvalues
    
    respond_to do |format|
      format.csv { render 'daily_values/daily_values' }
    end
    
  end
  
  protected

  def search_dailyvalues 
    if api_params[:siteid].present?
      @dailyvalues = @dailyvalues.where(siteid: params[:siteid])
    end

    if api_params[:startdate].present?
      @dailyvalues = @dailyvalues.where("utcdatetime >= ?",Date.parse(params[:startdate]).beginning_of_day)
    end
    
    if api_params[:enddate].present?
      @dailyvalues = @dailyvalues.where("utcdatetime <= ?",Date.parse(params[:enddate]).end_of_day)
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
