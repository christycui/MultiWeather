require 'open-uri'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_same_user
    unless logged_in? && current_user == @user
      flash[:danger] = "You don't have access to that."
      redirect_to root_path
    end
  end
  
  def require_user
    access_denied unless logged_in?
  end
  
  def access_denied
    flash[:info] = 'Please register or login to continue'
    redirect_to '/login'
  end
end
