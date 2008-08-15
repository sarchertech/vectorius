class Vector < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :permalink
  validates_uniqueness_of :name

  def before_validation

    if name
      self.permalink = (name.downcase.gsub(/[^[:alnum:]]/,'-')).gsub(/-{2,}/,'-')  
    end
    
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
  
  
end
