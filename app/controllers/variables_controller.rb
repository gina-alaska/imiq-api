class VariablesController < ApplicationController
  respond_to :json
  
  def index
    @variables = Variable.order('variablename ASC')
    @variables = @variables.includes(:sites)
    @variables = @variables.reject { |v| v.sites.empty? }
    
    # respond_to do |format|
    #   format.json {
    #     render json: @variables
    #   }
    # end
    
    respond_with @variables
  end
  
  def show
    @variable = Variable.find(params[:id])
    
    respond_with @variable
  end
  
  def list
    derived_vars = Site::DERIVED_VARIABLES.map do |name,klass|
      [klass.to_s.classify.constantize.pretty_name, name]
    end
    
    
    respond_to do |format|
      format.json {
        render json: {
          names: Variable.names,
          datatypes: Variable.datatypes,
          samplemediums: Variable.samplemediums,
          valuetypes: Variable.valuetypes,
          derived_variables: derived_vars,
          generalcategories: Variable.generalcategories
        }
      }
    end
  end
end
