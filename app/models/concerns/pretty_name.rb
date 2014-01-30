module PrettyName
  extend ActiveSupport::Concern
  
  module ClassMethods
    def pretty_name
      self::PRETTY_NAME
    end
  end
      
  def pretty_name
    self.class.pretty_name
  end
end