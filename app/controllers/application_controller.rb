class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :get_conversations

  include SessionsHelper

  def require_login
    unless logged_in?
      flash[:info] = t "controller.login_require"
      redirect_to root_url
    end
  end

  def get_conversations
    if logged_in?
      @users = User.where.not("id = ?",current_user.id).chronological
      @conversations = Conversation.involving(current_user).chronological
    end
  end
end
