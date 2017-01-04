class AddUnique < ActiveRecord::Migration
  def change
    add_index :meetups, :name, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
