# frozen_string_literal: true

class ServiceController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def show; end
end
