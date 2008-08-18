class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :permalink
      t.string :email
      t.string :ip
      t.string :url
      t.text :bio
      t.boolean :admin, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
