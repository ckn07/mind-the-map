class PoisController < ApplicationController
  def show
    # @poi = Poi.where.not(latitude: nil, longitude: nil)

    # @marker = @poi.map do |flat|
    #   {
    #     lng: flat.longitude,
    #     lat: flat.latitude
    #   }
    end

  def index

  end

  def poi_params
    params.require(:poi).permit(:photo)
  end
end
