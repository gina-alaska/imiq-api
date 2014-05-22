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
      respond_to do |format|
        format.csv {
          @fstep = datavalue.timestep
          @ffield = datavalue.field
          @fprettyname = datavalue.pretty_name

          filename_parts = ['Imiq_Data']
          @timenow = Time.now
          filename_parts += [@fstep,@ffield]
    
          filename = "#{filename_parts.join('_')}.csv"
          
          headers["Content-type"] = "text/csv"
          headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""

          get_data_values
        }
        format.json {
          set_cors_headers
          if params[:graph]
            render json: get_graph_data
          else
            render json: @values
          end
        }
      end
    end
  end

  protected
  
  def get_data_values
    @datavalue = DVFactory.slug(api_params[:field])
    @sites = Site.where(siteid: api_params[:siteids])
    @values = @datavalue.model.order(utcdatetime: :asc)
    if api_params[:startdate].present?
      @values = @values.startdate(Date.parse(api_params[:startdate]).beginning_of_day)
    end
    if api_params[:enddate].present?
      @values = @values.enddate(Date.parse(api_params[:enddate]).end_of_day)
    end
    
    @values = @values.where(siteid: api_params[:siteids])
  end
  
  def get_graph_data
    get_data_values
   
    {
      title: {
        text: @datavalue.pretty_name
      },
      xAxis: {
        title: { text: 'Date (UTC)' }
      },
      yAxis: {
        title: { text: @values.first.try(:unit).try(:unitsname) }
      },
      series: @sites.collect do |site|
        {
          name: site.sitename,
          data: @values.where(siteid: site.siteid).collect do |dv|
            [dv.utcdatetime.to_i * 1000, dv.datavalue]
          end
        }
      end
    }
  end
  
  def csv_error
    render text: 'An error was encountered while trying to create the CSV file'
  end

  def api_params
    api_request = params.permit(:limit, :page, :siteid, :siteids, :startdate, :enddate, :time_step, :field)

    api_request[:siteids] ||= []
    api_request[:limit] ||= 50
    api_request[:page] ||= 1
    api_request[:page] = 1 if api_request[:page].to_i == 0
    api_request[:start] = (api_request[:page].to_i-1) * api_request[:limit].to_i

    if api_request[:siteids].present?
      api_request[:siteids] = api_request[:siteids].split(',')
    end
    
    if api_request[:siteid].present?
      api_request[:siteids] << api_request[:siteid]
    end

    api_request
  end
end
