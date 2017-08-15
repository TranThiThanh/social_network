class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == Settings.remembers ? remember(user) :
          forget(user)
        redirect_to user
      else
        message  = "Account not activated. "
          message += "Check your email for the activation link."
          flash[:warning] = message
          redirect_to root_url
      end
    else
      flash[:danger] = t "controller.message"
      redirect_to root_url
    end
  end

  def destroy
    log_out
    flash[:success] = "You've just logged out."
    redirect_to root_url
  end
end
