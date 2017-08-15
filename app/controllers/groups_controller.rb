class GroupsController < ApplicationController
  before_action :load_group, except: [:index, :create, :new]

  def show
    @group_user = @group.group_user.build
    @post = @group.post.build
    @feed_items = Post.latest_posts_by_group(@group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params_create
    if @group.save
      GroupUser.create! user_id: @group.owner_id,
        group_id: @group.id, role: "Admin"
      flash[:success] = t "controller.success_group"
      redirect_to @group
    else
      flash[:danger] = t "controller.unsuccess_group"
      render :new
    end
  end

  def edit
    @users = User.all
    @groups = Group.all
    @members = @group.pending_members
    @post = @group.post.build
  end

  def update
    if @group.update_attributes group_params
      flash[:success] = t "controller.update"
      redirect_to @group
    else
      redirect_to @group
    end
  end

  def destroy
    if @group.destroy
      flash[:success] = t "controller.delete"
      redirect_to current_user
    else
      flash[:danger] = t "controller.cannot"
      redirect_to @group
    end
  end

  private

  def group_params
    params.require(:group).permit(:name_group, :description, :privacy, :avatar,
      :cover).merge! owner_id: current_user.id
  end

  def group_params_create
    params.require(:group).permit(:name_group, :description, :privacy).
      merge! owner_id: current_user.id
  end

  def load_group
    @group = Group.find_by id: params[:id]
    if @group.blank?
      flash[:danger] = t "controller.not_found_group"
      redirect_to root_url
    end
  end
end
