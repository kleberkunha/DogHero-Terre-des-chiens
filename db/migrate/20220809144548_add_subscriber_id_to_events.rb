# frozen_string_literal: true

class AddSubscriberIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :subscriber_id, :integer
  end
end
