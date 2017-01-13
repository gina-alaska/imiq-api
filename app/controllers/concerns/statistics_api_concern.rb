module StatisticsApiConcern
  extend ActiveSupport::Concern

  TITLE = {
    title: "Statistics",
    description: "Return statistics about the Imiq database"
  }
  
  API = {
    '/statistics.json' => {
      description: "Return statistics about the Imiq database.",
      api_params: [],
      url: "http://imiq-api.gina.alaska.edu/statistics.json",
      response: ""
      } }
end