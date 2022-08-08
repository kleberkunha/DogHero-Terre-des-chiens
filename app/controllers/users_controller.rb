class UsersController < ApplicationController



  def index
    @user = User.all
  end




  def search

    
  end

  def admin

    if params[:search].blank?
      @users = User.all
    else

      flash[:success] = "Search Passed !!!"
      @parameter = params[:search].downcase!
      @users = User.all.where("lower(first_name) LIKE ?", "%#{@parameter}%")
      puts ("----ADMIN------------#####  --------* ******") 

    end
  end



  def show
    @user = User.find(params[:id])

    @events = Event.all.where(user_id: current_user.id)

    @dogs = Dog.where(user_id: current_user.id)

    @users = User.all

  end


  def events
    @user = User.find(params[:id])
    @events = @user.events
  end

  def edit
    @user = current_user
  end




  def destroy
    @user = User.find(params[:id])

    if @user 
      @user.destroy
      flash[:success] = "User successfully Deleted!"
      redirect_to admin_path
    end

  end


  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :address, :description))
      flash[:success] = "User successfully updated!"
      redirect_to user_url(current_user)
    else
      flash.now[:error] = "To-do item update failed"
      render :edit
    end
  end

  private

  def users_params
    params.require(:users).permit(:first_name, :last_name, :email, :address, :description, :phone_number, :search)
  end


end
