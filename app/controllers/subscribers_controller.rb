# frozen_string_literal: true

class SubscribersController < ApplicationController
  def find_event
    Event.find(params[:id])
  end

  def create
    @subscriber = current_user.subscribers.new(user_id: current_user.id, event_id: params[:subscriber][:event_id])
    flash[:notice] = @subscriber.errors.full_messages.to_sentence unless @subscriber.save
    redirect_to events_path
  end

  def destroy
    params.permit!
    @subscriber = Subscriber.find_by(user_id: current_user.id, event_id: params[:subscriber][:event_id])

    @subscriber.destroy

    redirect_to events_path
  end

  # #Create a params for the subscribes, the params i was creating didn't work so i have to do as it is
  # private
  # def subscriber_params
  #    params.require(:subscriber).permit(:event_id, :user_id)
  # end
end
