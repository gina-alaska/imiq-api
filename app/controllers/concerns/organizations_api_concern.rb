module OrganizationsApiConcern
  extend ActiveSupport::Concern

  TITLE = {
    title: "Organizations",
    description: "The organizations endpoint provides a list of the institutions (federal, state, academic, etc.) that have contributed data to Imiq.  Contributing organizations include NOAA, UAF, USFWS."
  }
  
  API = {
    '/organizations/list.json' => {
      description: "Complete list of organizations that have contributed data to Imiq.",
      api_params: [],
      url: "http://imiq-api.gina.alaska.edu/organizations/list.json",
      response: 
"
[
 {
 organizationcode: AFCRFTSL
 description_with_code: AFCRFTSL - Terrestrial Sciences Laboratory, Geophysics Research Directorate, Air Force Cambridge Research Center
 }
 {
 organizationcode: AINA
 description_with_code: AINA - Arctic Institute of North America
 }, ....
]
"
   }
 }
end