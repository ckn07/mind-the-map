class ChallengesController < ApplicationController
# creer 2 before action, l'un pour chopper le game
# l'autre pour vérifié que le game a bien été instancié en multi: true
skip_before_action :authenticate_user!, only: [:new]
before_action :set_game_and_theme, only: [:new, :create]


  def new
       @poi = pick_a_random_poi_of_the_theme
 # @opponent = User.find(@game.user_one)
  end

 #  def edit
 #       @poi = pick_a_random_poi_of_the_theme
 # # @opponent = User.find(@game.user_one)
 #  end

  def create
    @game.user_two = current_user
    @poi = pick_a_random_poi_of_the_theme
      if @game.save
        redirect_to game_poi_path(@game,@poi)
      else
        redirect_to root_path
      end
  end

  # def update
  #   if @game.user_one == current_user
  #     @game.user_one = current_user
  #   else
  #     @game.user_two = current_user
  #   end
  #   @poi = pick_a_random_poi_of_the_theme
  #     if @game.save
  #       redirect_to game_poi_path(@game,@poi)
  #     else
  #       redirect_to root_path
  #     end
  # end

private
  def pick_a_random_poi_of_the_theme
    @pois = @theme.theme_pois
    @list_poi_on_going_game = []
    @pois.each do |poi|
      @list_poi_on_going_game << (poi.poi_id)
    end
    first_poi = @list_poi_on_going_game.sample
  end

  def set_game_and_theme
    @game = Game.find(params[:game_id])
    @theme = @game.theme
  end

end
