class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :vector_id
      t.integer :numerical_rating
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
