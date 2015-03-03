class LocationsController < ApplicationController
  
  before_action :require_user, only: [:index, :search, :show]
  before_action :set_location, only: [:show, :update, :destroy]
  before_action :require_creator, only: [:update, :destroy]

  def find
  end
  
  def search
    @results = params[:name]
    @location = Location.new
  end
  
  def create
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      flash[:success] = 'New location is added to your watch list!'
      redirect_to dashboard_path
    else
      flash[:danger] = 'Your location could not be added.'
      render 'search'
    end
  end
  
  def index
  end
  
  def show
  end
  
  def update
    if @location.update(location_params)
      flash[:success] = 'Nickname updated.'
      redirect_to dashboard_path
    else
      render 'index'
    end
  end
  
  def destroy
    @location.destroy
    flash[:success] = 'Location deleted.'.html_safe
    redirect_to dashboard_path
  end
  
  private
  def set_location
    @location = Location.find_by slug: params[:id]
  end
  
  def require_creator
    access_denied unless logged_in? && current_user == @location.user
  end
  
  def location_params
    params.require(:location).permit(:nickname, :name, :country, :city_id)
  end
  
end