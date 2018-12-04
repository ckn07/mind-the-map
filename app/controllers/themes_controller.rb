class ThemesController < ApplicationController
  def show
  end

  def index
  end

  def theme_params
    params.require(:city).permit(:photo)
  end
end
