class DerivedValuesController < ApplicationController
  rescue_from ActionView::Template::Error, with: :csv_error if Rails.env.production?
  
  def index
    datavalue = DVFactory.slug(api_params[:field])
    @sites = []
    @values = []
    @site_names = []

    if datavalue.model.nil?
      flash.now[:error] = "Invalid field (#{api_params[:field]}) or timestep (#{api_params[:time_step]}) params given"
    else
      # @values_csv_header = model.csv_header
      @values = datavalue.model.order(siteid: :asc, utcdatetime: :asc).has_data
      if api_params[:startdate].present?
        @values = @values.startdate(Date.parse(api_params[:startdate]).beginning_of_day)
      end

      if api_params[:enddate].present?
        @values = @values.enddate(Date.parse(api_params[:enddate]).end_of_day)
      end

      siteids = []
      if api_params[:siteids].present?
        siteids += api_params[:siteids].split(',')
      elsif api_params[:siteid].present?
        siteids << api_params[:siteid]
      end

      @values = @values.includes(:site).where(siteid: siteids)
      
      @fstep = datavalue.timestep
      @ffield = datavalue.field
      @fprettyname = datavalue.pretty_name

      filename_parts = ['Imiq_Data']
      @timenow = Time.now
      filename_parts += [@ffield,@fstep,@timenow.strftime("%Y%m%d-%H%M%S")]
    
      respond_to do |format|
        format.csv {
          filename = "#{filename_parts.join('_')}.csv"
          headers["Content-type"] = "text/csv"
          headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
        }
      end
    end
  end

  protected
  
  def csv_error
    render text: 'An error was encountered while trying to create the CSV file'
  end

  def api_params
    api_request = params.permit(:limit, :page, :siteid, :siteids, :startdate, :enddate, :time_step, :field)

    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i

    api_request
  end
end
