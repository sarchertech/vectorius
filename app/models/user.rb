class User < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :email
  
  has_many :vectors
  has_many :comments
  
  attr_accessible :name, :email, :url, :bio
  
  def before_validation

    if name
      self.permalink = (name.downcase.gsub(/[^[:alnum:]]/,'-')).gsub(/-{2,}/,'-')  
    end
    
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
  
end
