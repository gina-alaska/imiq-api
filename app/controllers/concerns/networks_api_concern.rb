module NetworksApiConcern
  extend ActiveSupport::Concern

  TITLE = {
    title: "Networks",
    description: "The networks endpoint provides a list of the networks (federal, state, etc.) that have contributed data to Imiq.  Contributing networks include RAWS, SNOTEL, NCDC ISH, etc."
  }
  
  API = {
    '/networks/list.json' => {
      description: "Complete list of networks that have contributed data to Imiq.",
      api_params: [],
      url: "http://imiq-api.gina.alaska.edu/networks/list.json",
      response: "
[
{
networkcode: ANWR water quantity report, 1991
description_with_code: ANWR water quantity report, 1991 - Alaska Fisheries Techinical Report Number 10
}
{
networkcode: CALM
description_with_code: CALM - Circumpolar Active Layer Monitoring
}
"
   }
 }
end