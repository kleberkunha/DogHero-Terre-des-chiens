class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @events = Event.all
  end

  def events
    @user = User.find(params[:id])
    @events = @user.events
  end
end
