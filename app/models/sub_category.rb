class SubCategory < ActiveRecord::Base
  belongs_to :primary_category, :class_name => 'Category'
  belongs_to :secondary_category, :class_name => 'Category'
  has_and_belongs_to_many :vectors
end
