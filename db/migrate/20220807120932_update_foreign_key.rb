class UpdateForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :events, :users

    add_foreign_key :events, :users, on_delete: :cascade
  end
end
