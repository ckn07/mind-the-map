class ThemesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @city = City.find(params[:id])
    @themes = @city.themes
  end

  def theme_params
    params.require(:theme).permit(:photo)
  end
end
