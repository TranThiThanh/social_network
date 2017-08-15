class GroupUsersController < ApplicationController
  before_action :load_group_user, only: [:show, :destroy]

  def new
    @group_user = GroupUser.new
  end

  def create
    @group_user = GroupUser.new group_user_params
    if @group_user.save
      flash[:success] = t "controller.success_group"
    else
      flash[:danger] = t "controller.unsuccess_group"
    end
    redirect_to @group_user.group
  end

  def destroy
    @group = @group_user.group
    if @group_user.destroy
      flash[:success] = t "controller.success_group"
    else
      flash[:danger] = t "controller.unsuccess_group"
    end
    redirect_to @group_user.group
  end

  private

  def group_user_params
    params.require(:group_user).permit(:group_id).
      merge! user_id: current_user.id
  end

  def load_group_user
    @group_user = GroupUser.find_by user_id: params[:id]
    if @group_user.blank?
      flash[:danger] = t "controller.not_found_user"
      redirect_to root_url
    end
  end
end
