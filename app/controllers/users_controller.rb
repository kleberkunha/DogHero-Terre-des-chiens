class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])

    @events = Event.where(user_id: current_user.id)

    @dogs = Dog.where(user_id: current_user.id)

  end

  def index

  end

  def events
    @user = User.find(params[:id])
    @events = @user.events
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :address, :description))
      flash[:success] = "User successfully updated!"
      redirect_to user_url(@user)
    else
      flash.now[:error] = "To-do item update failed"
      render :edit
    end
  end

  private

  def users_params
    params.require(:users).permit(:first_name, :last_name, :email, :address, :description, :phone_number)
  end

end
