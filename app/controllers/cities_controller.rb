class CitiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @city = City.find(params[:city_id])
  end

  def index
    @cities = City.all
  end

  def city_params
    params.require(:city).permit(:photo)
  end
end
