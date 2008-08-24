class CreateSubCategories < ActiveRecord::Migration
  def self.up
    create_table :sub_categories do |t|
      t.integer :primary_category_id
      t.integer :secondary_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sub_categories
  end
end
