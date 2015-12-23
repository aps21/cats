class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :name, null: false
      t.date :start_date
      t.date :end_date
      t.string :city, null: false
      t.string :address
      t.text :note

      t.timestamps null: false
    end
  end
end
