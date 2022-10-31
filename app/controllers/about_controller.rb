# frozen_string_literal: true

class AboutController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @users = User.where(role: 'admin')
  end

  def show
    @users = User.where(role: 'admin')
  end
end
