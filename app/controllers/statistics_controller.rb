class StatisticsController < ApplicationController
  include StatisticsApiConcern

  def index
    dv_count = ActiveRecord::Base.connection.execute("select * from tables.metrics where tablename='datavalues'").first
    @statistics = {
      data_values: dv_count['totalcount'],
      parameters: Variable.where.not(samplemedium: 'Instrument diagnostics').pluck(:variablename).uniq.count,
      sources: Source.count,
      networks: Network.count,
      updated_at: dv_count['updated_at'],
      
      changelog: Imiqversion.all.order(creationdate: :desc)
    }

    respond_to do |format|
      format.json {
        render json:@statistics
      }
    end
  end
end
