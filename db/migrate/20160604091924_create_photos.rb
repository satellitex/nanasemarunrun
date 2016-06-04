class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :room_id
      t.string :img
      t.boolean :represent

      t.timestamps null: false
    end
  end
end
