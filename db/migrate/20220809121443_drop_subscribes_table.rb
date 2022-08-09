class DropSubscribesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :subscribes
  end
end
