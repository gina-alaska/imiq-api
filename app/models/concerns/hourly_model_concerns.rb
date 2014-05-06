module HourlyModelConcerns
  extend ActiveSupport::Concern
  def timeformat  
    "%Y-%m-%d %X"
  end

  def timeformattext
    "Year-Month-Day Hour:Minute:Second (UTC)"
  end
end