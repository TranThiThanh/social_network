class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.blank?
      render "sessions/login"
    else
      render "users/show"
    end
  end
end
