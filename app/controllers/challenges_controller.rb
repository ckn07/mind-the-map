class ChallengesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    @game.user_two = current_user
    @theme = @game.theme
    @poi = pick_a_random_poi_of_the_theme
      if @game.save
        redirect_to game_poi_path(@game,@poi)
      else
        redirect_to root_path
      end
  end

private
  def pick_a_random_poi_of_the_theme
    @pois = @theme.theme_pois
    @list_poi_on_going_game = []
    @pois.each do |poi|
      @list_poi_on_going_game << (poi.poi_id)
    end
    first_poi = @list_poi_on_going_game.sample
  end

end
