class CreateSubCategoriesVectorsTable < ActiveRecord::Migration
  def self.up
    create_table :sub_categories_vectors, :id => false do |t|
      t.integer :sub_category_id
      t.integer :vector_id
    end
  end

  def self.down
    drop_table :sub_categories_vectors
  end
end
