class CitiesController < ApplicationController
  def show
  end

  def index
  end

  def city_params
    params.require(:city).permit(:photo)
  end
end
