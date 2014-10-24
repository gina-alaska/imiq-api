class VariablesController < ApplicationController
  include NetworksApiConcern
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
   # derived_vars = Site::DERIVED_VARIABLES.map do |name,klass|
   #   [klass.to_s.classify.constantize.pretty_name, name]
   # end

   search = Variable.search do
     with :has_sites, true
     with :has_datastreams, true
     facet :datatype
     facet :valuetype
     facet :generalcategory
     facet :variablename
   end

   @datatypes = search.facet(:datatype).rows.map(&:value).sort
   @valuetypes = search.facet(:valuetype).rows.map(&:value).sort
   @variablenames = search.facet(:variablename).rows.map(&:value).sort
   @generalcategories = search.facet(:generalcategory).rows.map(&:value).sort

   respond_to do |format|
     format.json {
       render json: {
         names: @variablenames,
         datatypes: @datatypes,
         # samplemediums: Variable.samplemediums,
         valuetypes: @valuetypes,
         # derived_variables: derived_vars,
         generalcategories: @generalcategories
       }
     }
   end
 end
end
