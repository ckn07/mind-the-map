class CitiesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :index]
  def show
  end

  def index
  end

  def city_params
    params.require(:city).permit(:photo)
  end
end
