class CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :destroy]
  before_action :load_comment, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comment.build comment_params
    if @comment.save
      flash[:success] = t "controller.success_comment"
    else
      flash[:danger] = t "controller.unsuccess_comment"
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    @post = @comment.post
  end

  def update
    if @comment.update_attributes comment_params
      flash[:success] = t "controller.update_comment"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = t "controller.update_comment_error"
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "controller.delete_comment"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = t "controller.cannot"
      redirect_to @comment.group
    end

  end


  private

  def comment_params
    params.require(:comment).permit :content, :post_id
  end

  def load_comment
  @comment = Comment.find_by id: params[:id]
    if @comment.blank?
      flash[:danger] = t "controller.not_found_post"
      redirect_to root_url
    end
  end

  def correct_user
    unless Comment.find(params[:id]).belongs_to?(current_user)
      redirect_back(fallback_location: root_path)
    end
  end
end
