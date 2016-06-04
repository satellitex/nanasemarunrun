class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
