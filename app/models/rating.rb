class Rating < ActiveRecord::Base
  validates_presence_of :numerical_rating
  
  belongs_to :vector
  
  attr_protected :ip
end
