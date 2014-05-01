module DailyModelConcerns
  extend ActiveSupport::Concern
  def timeformat  
    "%Y-%m-%d"
  end

#  module ClassMethods
  def timeformattext
    "Year-Month-Day (UTC)"
  end
#  end

end