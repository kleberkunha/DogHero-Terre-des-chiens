# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  has_many :subscribers, dependent: :delete_all

  has_one_attached :avatar
end
