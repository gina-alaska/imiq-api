module AnnualModelConcerns
  extend ActiveSupport::Concern
  def timeformat
    "%Y"
  end

  def timeformattext
    "Year (UTC)"
  end
end
