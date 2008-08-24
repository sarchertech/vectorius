class Vector < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :permalink
  
  belongs_to :user
  belongs_to :license
  has_many :comments
  has_many :ratings
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :sub_categories
  
  def before_validation

    if name
      self.permalink = (name.downcase.gsub(/[^[:alnum:]]/,'-')).gsub(/-{2,}/,'-')  
    end
    
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
  
end
