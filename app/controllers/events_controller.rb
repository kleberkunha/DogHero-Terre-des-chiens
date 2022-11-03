# frozen_string_literal: true

class EventsController < ApplicationController
  load_and_authorize_resource only: %i[new edit destroy]

  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /events or /events.json
  def index
    @events = Event.all.order(created_at: :desc)
  end

  def find_event
    Event.find(params[:id])
  end

  # GET /events/1 or /events/1.json
  def show
    @events = Event.all

    @users = []
    subscribers = Subscriber.where(event_id: find_event)
    subscribers.each do |subscriber|
      user_id = subscriber.user_id
      user = User.find(user_id)
      @users << user
    end
    @users
    @subscribers = @event.subscribers
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])

    if @event.nil?
      render 'errors/event_not_found'
      return
    end

    unless current_user.id === @event.user_id
      render 'errors/not_found'
      nil
    end
  end

  def get_event_of_user
    @single_event = Event.where(user_id: current_user.id)
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_user_path(current_user), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    if current_user.role === 'admin'
      respond_to do |format|
        format.html { redirect_to events_path, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_user_path(current_user), notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :body, :start_date, :end_date, :price, :location, :description,
                                  :subscriber, :first_name, :avatar)
  end
end
