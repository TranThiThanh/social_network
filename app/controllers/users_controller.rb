class UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params_signup
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:success] = t "controller.flashs"
      redirect_to root_url
    else
      render :new
    end
  end

  def index
    if params[:search]
      @users = User.search(params[:search]).alphabetize.
        paginate page: params[:page], per_page: Settings.number_of_page
    else
      @users = User.all.alphabetize.paginate page: params[:page],
        per_page: Settings.number_of_page
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controller.update"
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "controller.delete"
      redirect_to root_url
    else
      flash[:danger] = t "controller.cannot"
      redirect_to profile_path
    end
  end

  private

  def user_params_signup
    params.require(:user).permit :first_name, :last_name, :username, :email,
      :password, :password_confirmation, :birthday
  end

  def user_params
    params.require(:user).permit :username, :first_name, :last_name, :email,
      :password, :password_confirmation, :address, :phone, :job, :birthday,
      :gender, :avatar, :cover
  end

  def load_user
    @user = User.find_by id: params[:id]
    if @user.blank?
      flash[:danger] = t "controller.not_found_user"
      redirect_to root_url
    end
  end
end
