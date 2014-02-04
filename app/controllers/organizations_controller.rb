class OrganizationsController < ApplicationController
  def list
    # @organizations = Organization.order(:organizationcode).includes(:sites)
    # @organizations = @organizations.reject { |org| org.sites.empty? }
    search = Organization.search do
      with :has_sites, true
      order_by :organizationcode, :asc
    end
    
    @organizations = search.results
    
    respond_to do |format|
      format.json {
        render json: @organizations.as_json(:only => [:organizationcode], methods: [:description_with_code])
      }
    end
  end
end
