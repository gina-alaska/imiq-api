module Search
  module Sources
    extend ActiveSupport::Concern
    
    included do
      searchable do
        string :contactname
        
        #boolean :has_sites do
        #  self.sites.count > 0
        #end

        #boolean :has_data do
        #  self.datastreams.count > 0
        #end
      end
    end
  end
end