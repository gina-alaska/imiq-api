module DailyModelConcerns
  extend ActiveSupport::Concern
  def timeformat  
    "%Y-%m-%d"
  end

  def timeformattext
    "Year-Month-Day (UTC)"
  end

end