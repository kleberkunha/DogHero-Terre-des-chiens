# frozen_string_literal: true

class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :description
      t.string :gender
      t.string :friendly
      t.string :castrated
      t.string :alergic
      t.string :trained
      t.integer :user_id

      t.timestamps
    end
  end
end
