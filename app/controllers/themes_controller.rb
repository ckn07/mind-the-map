class ThemesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def show
    @city = City.find(params[:city_id])
  end

  def index
    @city = City.find(params[:city_id])
    @themes = @city.themes
  end

  def theme_params
    params.require(:theme).permit(:photo)
  end
end
