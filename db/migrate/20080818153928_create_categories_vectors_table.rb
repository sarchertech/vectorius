class CreateCategoriesVectorsTable < ActiveRecord::Migration
  def self.up
    create_table :categories_vectors, :id => false do |t|
      t.integer :category_id
      t.integer :vector_id
    end
  end

  def self.down
    drop_table :categories_vectors
  end
end
