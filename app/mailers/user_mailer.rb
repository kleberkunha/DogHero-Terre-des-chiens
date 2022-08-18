class UserMailer < ActionMailer::Base
    default :from => "kleberkunha1@gmail.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => 'hello.kleberkunha@gmail.com', :subject => "Registration Confirmation")
 end