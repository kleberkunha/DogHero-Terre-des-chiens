class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      UserMailer.with(user: user).welcome_email.deliver_later
    end
  end
end