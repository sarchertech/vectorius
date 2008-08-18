class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :vector_id
      t.string :user_id
      t.text :body
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
