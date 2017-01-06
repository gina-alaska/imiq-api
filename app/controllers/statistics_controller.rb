class StatisticsController < ApplicationController
  include StatisticsApiConcern

  def index
    @statistics = {
      #data_values: Datavalue.count,
      parameters: Variable.where.not(samplemedium: 'Instrument diagnostics').pluck(:variablename).uniq.count,
      sources: Source.count,
      networks: Network.count
    }

    respond_to do |format|
      format.json {
        render json:@statistics
      }
    end
  end
end
