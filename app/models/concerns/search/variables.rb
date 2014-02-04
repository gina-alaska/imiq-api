module Search
  module Variables
    extend ActiveSupport::Concern
    
    included do
      searchable do
        integer :datastream_ids, multiple: true
        integer :site_ids, multiple: true
        
        string  :datatype
        string  :valuetype
        string  :variablename
        string  :generalcategory
        
        boolean :has_sites do
          self.sites.count > 0
        end
        boolean :has_datastreams do
          self.datastreams.count > 0
        end
      end
    end
  end
end