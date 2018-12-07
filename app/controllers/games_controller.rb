class GamesController < ApplicationController

  # affichage de la page finale du jeu
  def show
    @game = Game.find(params[:id])
    @user = current_user
    @theme = @game.theme
    @pois = @theme.pois
    @answers = Answer.where(game_id: @game)
    @total_score = total_score_calculation
    @markers = @pois.map do |poi|
      {
        lng: poi.longitude,
        lat: poi.latitude,
        color: "#08c299"
      }
    end
  end

  def create
    @user = current_user
    # instanciation par défaut sur Paris (city id 1)
    @game = Game.new
    @game.user_one = @user
    @theme = Theme.find(params[:theme_id])
    @game.theme = @theme
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

  def total_score_calculation
    total_score = 0
    @answers.each do |answer|
      total_score += answer.score
    end
    return total_score
  end


end
