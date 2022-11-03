# frozen_string_literal: true

class DogsController < ApplicationController
  load_and_authorize_resource only: %i[new edit destroy]

  # GET /dogs or /dogs.json
  def index
    @dogs = Dog.all
  end

  # GET /dogs/1 or /dogs/1.json
  def show; end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit; end

  # POST /dogs or /dogs.json
  def create
    @dog = Dog.new(dog_params)
    @dog.user_id = current_user.id
    respond_to do |format|
      if @dog.save
        format.html { redirect_to admin_user_path(current_user), notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1 or /dogs/1.json
  def update
    @dog = Dog.find(params[:id])
    if @dog.update(params.require(:dog).permit(:name, :age, :description, :avatar, :gender, :friendly, :castrated,
                                               :trained, :alergic))
      flash[:success] = 'Chien mis à jour avec succès!'
      redirect_to admin_users_path
    else
      flash.now[:error] = 'Mise à jour a échoué'
      render :edit
    end
  end

  # DELETE /dogs/1 or /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_url(current_user.id), notice: 'Le chien a été détruit avec succès.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dog
    @dog = Dog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dog_params
    params.require(:dog).permit(:name, :age, :gender, :friendly, :castrated, :trained, :alergic, :description, :avatar)
  end
end
