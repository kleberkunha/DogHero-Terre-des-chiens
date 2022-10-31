# frozen_string_literal: true

class Dog < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
end
