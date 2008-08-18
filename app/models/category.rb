class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_and_belongs_to_many :vectors
  
  def before_validation

    if name
      self.permalink = (name.downcase.gsub(/[^[:alnum:]]/,'-')).gsub(/-{2,}/,'-')  
    end
    
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
  
end
