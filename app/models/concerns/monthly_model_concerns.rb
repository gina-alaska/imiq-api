module MonthlyModelConcerns
  extend ActiveSupport::Concern
  def timeformat  
    "%Y-%m"
  end

  def timeformattext
    "Year-Month (UTC)"
  end

end