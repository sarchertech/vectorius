class CreateVectors < ActiveRecord::Migration
  def self.up
    create_table :vectors do |t|
      t.integer :user_id
      t.integer :license_id
      t.string :name
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :vectors
  end
end
