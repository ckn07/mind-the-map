class PoisController < ApplicationController
  def show
    @poi = Poi.find(params[:id])
  end

  def poi_params
    params.require(:poi).permit(:photo)
  end
end

    # @marker = @poi.map do |flat|
    #   {
    #     lng: poi.longitude,
    #     lat: poi.latitude
