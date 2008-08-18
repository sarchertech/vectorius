class Comment < ActiveRecord::Base
  validates_presence_of :body
  
  belongs_to :vector
  belongs_to :user
  
  attr_protected :ip
  
end
