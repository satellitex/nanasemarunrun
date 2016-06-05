class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :room_id
      t.integer :user_id
      t.string :senddate

      t.timestamps null: false
    end
  end
end
