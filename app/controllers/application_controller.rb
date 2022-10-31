# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]

  def created_at
    attributes['created_at'].strftime('%d-%m-%Y %H:%M')
  end
end
