# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hello.kleberkunha@gmail.com'
  layout 'mailer'
end
