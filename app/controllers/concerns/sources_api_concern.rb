module SourcesApiConcern
  extend ActiveSupport::Concern
  
  TITLE = {
    title: "Sources",
    description: "The sources endpoint provides a list of dataset sources that have been ingested into the Imiq database."
  }
  
  API = {
    '/sources.json?{query}' => {
      description: "Parse list of data sources within Imiq.",
      url: "http://imiq-api.gina.alaska.edu/sources.json?limit=2&page=1",
      api_params: [{ 
        name: 'limit', 
        description: 'number of source records to be retrieved per page', 
        type: 'integer', 
        default: '50',
        required: false
      }, { 
        name: 'page', 
        description: 'division of sources into sections (using limit to define number per section)', 
        type: 'integer', 
        default: '1',
        required: false 
      }],
      response:"
[
{
url: http://192.168.222.226/sources/1.json
sourceid: 1
organization: International Arctic Research Center and Water and Environmental Research Center, Institute of Northern Engineering, University of Alaska Fairbanks 
sourcedescription: Meteorological data collected for the Total Precipitation Network
sourcerole: Originator
sourcelink: null
contactname: Jessie Cherry
phone: 907-474-5730
email: jcherry@iarc.uaf.edu
address: 930 Koyukuk Dr.
city: Fairbanks
state: AK
zipcode: 99775
citation: Cherry, J.E. [year of retrieval], Climate data from the International Arctic Research Center, University of Alaska-Fairbansk and Water and Environmental Research Center, Institue of Northern Engineering, University of Alaska Fairbanks.
metadataid: 0
updated_at: 2014-08-25T14:52:46.403Z
}
{
url: http://192.168.222.226/sources/2.json
sourceid: 2
organization: U.S. Fish and Wildlife Service
sourcedescription: Fish presence, species composition, abundance, water quality, hydrology, and bathymetry data collected in the Arctic National Wildlife Refuge and the BLM National Petroleum Reserve-Alaska. 
sourcerole: Publisher
sourcelink: http://alaska.fws.gov/fisheries/fieldoffice/fairbanks/pdf/Aquabase_LM.pdf
contactname: Dave Daum 
phone: 907-456-0290
email: david_daum@fws.gov
address: U.S. Fish and Wildlife Service, 101 12th Avenue 
city: Fairbanks
state: AK
zipcode: 99701
citation: Daum, D. [date of download]. AQUABASE, Fishery Resource Office, U.S. Fish and Wildlife Service.
metadataid: 0
updated_at: 2014-08-25T14:52:46.403Z
},....
]   
      "
    },
    '/sources/{sourceid}.json' => {
      description: "Parse single data source (defined by source id) within Imiq.",
      url: "http://imiq-api.gina.alaska.edu/sources/1.json",
      url_params: [
        {
          name: 'sourceid',
          required: true,
          values: %w{ integer }
          }],      
      api_params: [
      ],
      response:
"
{
url: http://192.168.222.226/sources/1.json
sourceid: 1
organization: International Arctic Research Center and Water and Environmental Research Center, Institute of Northern Engineering, University of Alaska Fairbanks 
sourcedescription: Meteorological data collected for the Total Precipitation Network
sourcerole: Originator
sourcelink: null
contactname: Jessie Cherry
phone: 907-474-5730
email: jcherry@iarc.uaf.edu
address: 930 Koyukuk Dr.
city: Fairbanks
state: AK
zipcode: 99775
citation: Cherry, J.E. [year of retrieval], Climate data from the International Arctic Research Center, University of Alaska-Fairbansk and Water and Environmental Research Center, Institue of Northern Engineering, University of Alaska Fairbanks.
metadataid: 0
updated_at: 2014-08-25T14:52:46.403Z
}
"        
  }
}
end