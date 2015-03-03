class LocationsController < ApplicationController
  
  before_action :require_user, only: [:index, :search]
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
    if current_user.locations.select {|loc| loc.city_id == @location.city_id} != []
      flash[:notice] = 'This location is already added.'
      redirect_to :back
    end
    if @location.save
      flash[:success] = 'New location is added to your watch list!'
      redirect_to '/dashboard'
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
      flash[:notice] = 'Nickname added.'
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  def destroy
    @location.destroy
    flash[:success] = 'Location deleted.'.html_safe
    redirect_to root_path
  end
  
  private
  def set_location
    @location = Location.find(params[:id])
  end
  
  def require_creator
    access_denied unless logged_in? && current_user == @location.user
  end
  
  def location_params
    params.require(:location).permit(:nickname, :name, :country, :city_id)
  end
  
end