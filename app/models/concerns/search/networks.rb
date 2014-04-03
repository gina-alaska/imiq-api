module Search
  module Networks
    extend ActiveSupport::Concern
    
    included do
      searchable do
        string :networkcode
        string :networkdescription
        
        boolean :has_sites do
          self.sites.count > 0
        end
      end
    end
  end
end