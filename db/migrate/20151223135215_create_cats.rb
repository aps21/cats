class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.date :birthdate
      t.integer :ownered_by
      t.boolean :neutered
      t.integer :sex, null: false
      t.boolean :vaccinated
      t.boolean :on_sale

      t.timestamps null: false
    end
  end
end
