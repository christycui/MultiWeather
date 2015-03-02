class SessionsController < ApplicationController
  
  def new
    redirect_to '/dashboard' if logged_in?
  end
  
  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, you've now logged in."
    else
      flash[:danger] = "There was something wrong with your username or password."
    end
    redirect_to '/dashboard'
  end
  
  def destroy
    session[:user_id] = nil
    flash[:info] = "You've logged out."
    redirect_to root_path
  end
end