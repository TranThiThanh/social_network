class UserMailer < ApplicationMailer

  def account_activation user
    @user = user
    mail to: user.email, subject: I18n.t("mailer.email")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: I18n.t("mailer.password")
  end
end
