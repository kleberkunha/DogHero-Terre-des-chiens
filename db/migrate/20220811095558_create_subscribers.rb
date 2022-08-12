class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.references :user, null: false, on_delete: :cascade,foreign_key: true
      t.references :event, null: false, on_delete: :cascade,foreign_key: true

      t.timestamps
    end
    add_index :subscribers, [:user_id, :event_id], unique: true
  end
end
