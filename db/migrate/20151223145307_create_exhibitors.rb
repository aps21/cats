class CreateExhibitors < ActiveRecord::Migration
  def change
    create_table :exhibitors do |t|
      t.belongs_to :cat, null: false
      t.belongs_to :exhibition, null: false

      t.timestamps null: false
    end
  end
end
