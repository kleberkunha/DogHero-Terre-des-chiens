# frozen_string_literal: true

class ContactController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end
end
