class PoisController < ApplicationController
  def show
  end

  def index
  end

  def poi_params
    params.require(:poi).permit(:photo)
  end
end
