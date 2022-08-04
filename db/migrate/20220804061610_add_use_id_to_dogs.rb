class AddUseIdToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :user_id, :integer
  end
end
