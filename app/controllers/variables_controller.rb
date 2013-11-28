class VariablesController < ApplicationController
  def index
    @variables = Variable.select('variableid, variablecode, variablename, samplemedium, datatype').order('variablename ASC')
    @variables = @variables.includes(:sites)
    @variables = @variables.reject { |v| v.sites.empty? }
    
    respond_to do |format|
      format.json {
        render json: @variables
      }
    end
  end
  
  def list
    respond_to do |format|
      format.json {
        render json: {
          names: Variable.names,
          datatypes: Variable.datatypes,
          samplemediums: Variable.samplemediums
        }
      }
    end
  end
end
