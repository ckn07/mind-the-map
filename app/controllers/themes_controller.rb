class ThemesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def show
  end

  def index
  end

  def theme_params
    params.require(:city).permit(:photo)
  end
end
