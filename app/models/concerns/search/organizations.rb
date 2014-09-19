module Search
  module Organizations
    extend ActiveSupport::Concern
    
    included do
      searchable do
        string :organizationcode
        string :organizationdescription
        
        boolean :has_sites do
          self.sites.count > 0
        end
        
        boolean :has_data do
          self.datastreams.count > 0
        end
      end
    end
  end
end