class RelationshipController < ApplicationController
  before_action :load_friend, only: [:update, :destroy]

  def create
    friendship = current_user.requested_friendships.build(
      followed_id: params[:followed_id])
    if friendship.save
      flash[:notice] = t "controller.frequest"
    else
      flash[:error] = t "controller.request_error"
    end
    redirect_to current_user
  end

  def update
    @friendship.update accepted: :friend
    if @friendship.save
      flash[:success] = t "controller.accepted"
    else
      flash[:error] = t "controller.unaccept"
    end
    redirect_to current_user
  end

  def destroy
    if @friendship.destroy
      flash[:success] = t "controller.remove_friend"
    else
      flash[:danger] = t "controller.not_found_user"
    end
    redirect_to current_user
  end

  private

  def load_friend
    @friendship = Relationship.find_by id: params[:id]
    if @friendship.blank?
      flash[:danger] = t "controller.not_found_user"
      redirect_to root_url
    end
  end
end
