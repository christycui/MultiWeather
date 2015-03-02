class LocationsController < ApplicationController
  before_action :require_user, only: [:index, :search]
  before_action :require_same_user, only: [:create]
  def find
  end
  
  def search
    @results = params[:name]
  end
  
  def create
    @location = Location.new(user: current_user, city_id: params[:city_id], country: params[:country], name: params[:name])
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
    @location = Location.find(params[:id])
  end
  
end