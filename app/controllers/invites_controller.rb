class InvitesController < ApplicationController
  before_action :load_group, only: [:index]
  before_action :load_invite, only: [:destroy, :update]
  def index
    if params[:search]
      @users = User.search(params[:search]).alphabetize.
        paginate page: params[:page], per_page: Settings.number_of_page
    else
      @users = User.all.alphabetize.paginate page: params[:page],
        per_page: Settings.number_of_page
    end
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new invite_params
    if @invite.save
      flash[:notice] = t "controller.frequest"
    else
      flash[:error] = t "controller.request_error"
    end
    redirect_to @invite.group
  end

  def update
    @invite.update accepted: :member
    if GroupUser.create! user_id: @invite.recipient_id,
      group_id: @invite.group_id
      @invite.destroy
      flash[:success] = t "controller.success_group"
    else
      flash[:danger] = t "controller.exited"
    end
    redirect_to @invite.group
  end

  def destroy
    if @invite.destroy
      GroupUser.destroy! user_id: @invite.recipient_id,
      group_id: @invite.group_id
      flash[:success] = t "controller.remove_friend"
    else
      flash[:danger] = t "controller.not_found_user"
    end
    redirect_to current_user
  end

  private

  def invite_params
    params.require(:invite).permit(:recipient_id, :group_id).
      merge! sender_id: current_user.id
  end

  def load_group
    @group = Group.find_by id: params[:group_id]
    return if @group
      flash[:danger] = t "controller.not_found"
      redirect_to root_url
  end

  def load_invite
    @invite = Invite.find_by id: params[:id]
    if @invite.blank?
      flash[:danger] = t "controller.not_found_user"
      redirect_to root_url
    end
  end
end
