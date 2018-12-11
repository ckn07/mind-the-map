class PoisController < ApplicationController
  def show
    @poi = Poi.find(params[:id])
    @game = Game.find(params[:game_id])
    @answer = Answer.new
    @counter_what_is_left = how_many_pois_are_left
    @counter_total = @list_poi_on_going_game.count
    @counter_left = @counter_total - @counter_what_is_left
  end

  def poi_params
    params.require(:poi).permit(:photo)
  end
end

    # @marker = @poi.map do |flat|
    #   {
    #     lng: poi.longitude,
    #     lat: poi.latitude
def how_many_pois_are_left
    @theme = @game.theme
    @pois = @theme.theme_pois
    @list_poi_on_going_game = []
    @pois.each do |poi|
      @list_poi_on_going_game << poi.poi_id
    end
    @pois_already_answered = []
    @list_answers = Answer.where(game_id: @game)
    @list_answers.each do |poi|
      @pois_already_answered << poi.poi_id
    end
    remaining_poi = @list_poi_on_going_game - @pois_already_answered
    remaining_poi.count
  end
