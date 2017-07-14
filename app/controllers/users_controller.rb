class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.blank?
      render "sessions/login"
    else
      render "users/show"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params_signup
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:success] = t "controller.flashs"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params_signup
    params.require(:user).permit :first_name, :last_name, :username, :email,
      :password, :password_confirmation, :birthday
  end
end
