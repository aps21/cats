class AddBreedToCats < ActiveRecord::Migration
  def change
    add_reference :cats, :breed, null: false
  end
end
