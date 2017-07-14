class ProfileController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.blank?
      flash[:danger] = t "controller.not_found_profile"
      redirect_to root_url
    else
      render :show
    end
  end
end
