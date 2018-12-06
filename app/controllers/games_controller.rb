class GamesController < ApplicationController

  # affichage de la page finale du jeu
  def show
    @user = current_user
    @game = Game.find(params[:id])
    @theme = @game.theme
    @pois = @theme.pois
  end

  def create
    @user = current_user
    # instanciation par défaut sur Paris (city id 1)
    @game = Game.new
    @game.user_one = @user
    @theme = Theme.find(params[:theme_id])
    @game.theme = @theme
    @poi = pick_a_random_poi_of_the_them
    if @game.save
      redirect_to game_poi_path(@game,@poi)
    else
      raise
      redirect_to root_path
    end

  end

  private
  def pick_a_random_poi_of_the_them
    @pois = @theme.theme_pois
    @list_poi_on_going_game = []
    @pois.each do |poi|
      @list_poi_on_going_game << (poi.poi_id)
    end
    first_poi = @list_poi_on_going_game.sample
  end


end
