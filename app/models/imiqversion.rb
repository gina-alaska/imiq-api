class Imiqversion < ActiveRecord::Base  
  self.table_name = 'imiqversion'

  def version
    self.try(:versionnumber)
  end
  
  def description
    self.try(:versiondescription)
  end
end
