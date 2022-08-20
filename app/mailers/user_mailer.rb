class UserMailer < ActionMailer::Base
   default from: 'hello.kleberkunha@gmail.com'
   def welcome_email
      @user = params[:user]

      @url  = 'https://doghero1.herokuapp.com/'
  
      mail(to: @user.email, subject: "DogHero Email confirmation !")
   end
 end