class NetworksController < ApplicationController
  include NetworksApiConcern
  def list
    search = Network.search do
      with :has_sites, true
      order_by :networkcode, :asc
    end
    @networks = search.results
    respond_to do |format|
      format.json {
        render json: @networks.as_json(:only => [:networkcode], methods: [:description_with_code])
      }
    end
  end
end
