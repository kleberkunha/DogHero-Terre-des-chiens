class SubscribersController < ApplicationController

    def create
        @subscriber = current_user.subscribers.new(subscriber_params)
        if !@subscriber.save
            flash[:notice] = @subscriber.errors.full_messages.to_sentence
        end
        redirect_to events_path
    end

    def destroy
        @subscriber = current_user.subscribers.find(params[:id])

        event = @subscriber.event

        @subscriber.destroy

        redirect_to events_path
    end




    private

    def subscriber_params
        params.require(:subscriber).permit(:event_id)
    end

end
