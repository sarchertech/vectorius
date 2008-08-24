class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_and_belongs_to_many :vectors
  has_many :sub_categories, :foreign_key => 'primary_category_id',
                            :dependent => :destroy
  has_many :secondary_categories, :through => :sub_categories
  #added sub_categories2 only for the dependent => destroy, but this relationship
  #shouldn't be used b/c category.secondary_category is only intented to be one way
  has_many :sub_categories2, :foreign_key => 'secondary_category_id',
                             :class_name => 'SubCategory',
                             :dependent => :destroy
  
  def before_validation

    if name
      self.permalink = (name.downcase.gsub(/[^[:alnum:]]/,'-')).gsub(/-{2,}/,'-')  
    end
    
  end
  
  def to_param
    "#{id}-#{permalink}"
  end
  
end
