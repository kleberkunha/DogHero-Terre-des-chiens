class AdminUsersController < ApplicationController
  before_action :not_same_user

  #Prevent user to get the information of another user changing the parameters in the url#
  ########################################################################################
  def not_same_user
    params_id = params[:id].to_i;
    if params_id != current_user.id
      flash[:error] = "Vous n'êtes pas le bon utilisateur"
      redirect_to root_path
    end
  end
  ########################################################################################

  def index
    @users = User.all
    @events = Event.all
  end

  def search; end

  def admin
    if params[:search].blank?
      @users = User.all
    else

      flash[:success] = 'Search Passed !!!'
      @parameter = params[:search].downcase!
      @users = User.all.where('lower(first_name) LIKE ?', "%#{@parameter}%")
    end

    @events = Event.all
  end

  def show
    @user = User.find(params[:id])

    unless current_user.id == @user.id || current_user.role == 'admin'
      render 'errors/not_found'
      return
    end

    @events = Event.all.where(user_id: current_user.id)

    @dogs = Dog.where(user_id: current_user.id)

    @users = User.all

    @user_count = User.count

    @subscribed_events = []
    @all_events_that_i_subscribe = Subscriber.where(user_id: params[:id])
    @all_events_that_i_subscribe.each do |subscriber|
      event_id = subscriber.event_id
      event = Event.find(event_id)
      @subscribed_events << event
    end
    @subscribed_events
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
      flash[:success] = 'User successfully Deleted!'
      redirect_to admin_path
    end
  end

  def event_destroy
    @event.destroy

    if current_user.role === 'admin'
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_user_path(current_user), notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :address, :avatar))
      flash[:success] = 'User successfully updated!'
      redirect_to admin_user_url(current_user)
    else
      flash.now[:error] = 'To-do item update failed'
      render :edit
    end
  end

  private

  def users_params
    params.require(:users).permit(:first_name, :last_name, :email, :address, :phone_number, :search, :subscriber,
                                  :avatar)
  end
end
