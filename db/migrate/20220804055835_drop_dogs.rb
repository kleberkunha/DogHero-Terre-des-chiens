class DropDogs < ActiveRecord::Migration[6.0]
  def change
    drop_table :dogs
  end
end
