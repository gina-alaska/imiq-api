class OrganizationsController < ApplicationController
  def list
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
