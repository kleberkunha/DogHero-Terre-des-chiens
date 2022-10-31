# frozen_string_literal: true

class AddEventIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_id, :bigint, default: false
  end
end
