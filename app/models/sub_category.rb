class SubCategory < ActiveRecord::Base
  belongs_to :primary_category, :class_name => 'Category'
  belongs_to :secondary_category, :class_name => 'Category'
  has_and_belongs_to_many :vectors
  
  def self.sub_category_assigner(array_of_category_ids, vector)
    array_of_category_ids.each do |a|
      array_of_category_ids.each do |b|
        unless a == b
          sub_cat = SubCategory.find_or_create_by_primary_category_id_and_secondary_category_id(a, b)
          sub_cat.vectors << vector
        end
      end
    end
  end
  
end
