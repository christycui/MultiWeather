
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  def show
  end
  
  def new
    redirect_to dashboard_path if logged_in?
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account is successfully created."
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated."
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end
  
  private
  def set_user
    @user = User.find_by slug: params[:id]
  end
  
  def user_params
    params.require(:user).permit(:username, :password, :email, :timezone, :display_unit)
  end
  
  def require_same_user
    unless logged_in? && current_user == @user
      flash[:danger] = "You don't have access to that."
      redirect_to root_path
    end
  end
end