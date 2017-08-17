class PostsController < ApplicationController
  before_action :load_post, only: [:show]
  before_action :correct_user, only: [:update, :destroy]

  def show
  end

  def new
    @post = Post.new
    @image = @post.image.build
  end

  def create
    @post = Post.new post_params
    if @post.save
      if params[:image].present?
        params[:image]["name_image"].each do |a|
          @image = @post.image.create! name_image: a
        end
      end
      flash[:success] = t "controller.success_post"
    else
      @feed_items = []
      flash[:danger] = t "controller.unsuccess_post"
    end
    redirect_to @post.group
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    if @post.update post_params
      if params[:image].present?
        params[:image]["name_image"].each do |a|
          @image = @post.image.update name_image: a
        end
      end
      flash[:success] = t "controller.update_post"
    else
      flash.now[:error] = t "controller.update_post_error"
    end
    redirect_to @post.group
  end

  def destroy
    if @post.destroy
      flash[:success] = t "controller.delete_post"
    else
      flash[:danger] = t "controller.cannot"
    end
    redirect_to @post.group
  end

  private

  def post_params
    params.require(:post).permit(:content, :group_id,
      image_attributes: [:id, :post_id, :name_image]).
      merge! user_id: current_user.id
  end

  def load_post
    @post = Post.find_by id: params[:id]
    if @post.blank?
      flash[:danger] = t "controller.not_found_post"
      redirect_to root_url
    end
  end

  def correct_user
    @post = current_user.post.find_by id: params[:id]
    redirect_to root_url if @post.blank?
  end
end
