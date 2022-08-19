class UserMailer < ActionMailer::Base
   def new_order_email
      @user = User.find(params[:id])
  
      mail(to: @user.email, subject: "You got a new order!")
    end
end