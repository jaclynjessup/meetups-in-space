class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :mid, null: false
      table.string :name, null: false
      table.text :description, null: false
      table.string :location, null: false
      table.string :uid, null: false

      table.timestamps null: false
    end

    add_index :meetups, [:mid, :uid], unique: true
  end
end
