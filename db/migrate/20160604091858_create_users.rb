class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :accountname
      t.string :facebook_token
      t.integer :age
      t.string :name
      t.string :sex
      t.string :url
      t.integer :passport_id

      t.timestamps null: false
    end
  end
end
