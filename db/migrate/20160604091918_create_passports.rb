class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.boolean :passport
      t.string :lastupdated

      t.timestamps null: false
    end
  end
end
