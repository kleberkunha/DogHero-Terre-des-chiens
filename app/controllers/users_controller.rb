class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @events = Event.all
  end

  def events
    @user = User.find(params[:id])
    @events = @user.events
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:users).permit(:first_name, :last_name, :email)
  end

end
