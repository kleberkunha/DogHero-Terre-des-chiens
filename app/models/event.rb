class Event < ApplicationRecord
  belongs_to :user

  has_many :subscribers, dependent: :delete_all
end
