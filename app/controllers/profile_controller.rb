require "will_paginate/array"

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

  def index
    @users = current_user.friends.paginate page: params[:page],
      per_page: Settings.number_of_page
  end
end
