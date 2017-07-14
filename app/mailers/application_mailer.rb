class ApplicationMailer < ActionMailer::Base
  default from: Settings.emails
  layout "mailer"
end
