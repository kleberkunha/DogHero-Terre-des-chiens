class FixMigrationName < ActiveRecord::Migration[6.0]
  def change
    rename_table :subscribes, :subscribers
  end
end
