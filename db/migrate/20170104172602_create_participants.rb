class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |table|
      table.belongs_to :user, null: false
      table.belongs_to :meetup, null: false

      table.timestamps
    end
  end
end
