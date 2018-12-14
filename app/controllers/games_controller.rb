class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  # affichage de la page finale du jeu
  def show
    @game = Game.find(params[:id])
    @user = current_user
    @theme = @game.theme
    @pois = @theme.pois
    @max_score = @pois.count * 20000

    @answers = Answer.where(game_id: @game, user_id: current_user)
    @markers = @pois.map do |poi|
      {
        lng: poi.longitude,
        lat: poi.latitude,
        color: "#08c299"
      }
    end

    if @game.multi # c'est y du multiplayer
      if @game.user_one == @user # qui est le joueur sur la show?
        @total_score = @game.score_one
        if @game.user_two.nil?
          @total_score_opponent = nil
          @opponent_name = nil
        else
          @total_score_opponent = @game.score_two
          @opponent_name = @game.user_two.username
        end
      else
        @total_score = @game.score_two
        @total_score_opponent = @game.score_one
        @opponent_name = @game.user_one.username
      end
    else # solo game
      @total_score = @game.score_one
    end

  end

  def create
    @user = current_user
    # instanciation par défaut sur Paris (city id 1)
    @game = Game.new(game_params)
    @game.user_one = @user
    @theme = Theme.find(params[:theme_id])
    @game.theme = @theme
    @poi = pick_a_random_poi_of_the_theme
    if @game.save
      respond_to do |format|
        format.html { redirect_to game_poi_path(@game,@poi) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- idem
      end
    end
  end

  def update
    @game = Game.find(params[:id])
    @answers = Answer.where(game_id: @game, user_id: current_user).order("score ASC")

    # check le user id?  si c'est dans user one ou two.
    if @game.user_one == current_user
      @game.score_one = total_score_calculation
      @game.total_time_one = total_time_calculation
      @game.distance_one = total_distance_calculation
      redirect_to game_path(@game)
    else
      @game.score_two = total_score_calculation
      @game.total_time_two = total_time_calculation
      @game.distance_two = total_distance_calculation
      redirect_to game_path(@game)
    end
    @game.save
  end

  def updatebis
    @game = Game.find(params[:game_id])

      if @game.update(multi: params[:game][:multi] == "true")
      respond_to do |format|
        format.html { redirect_to game_path(@game,@poi) }
        format.js  # <-- will render `app/views/games/updatebis.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- idem
      end
    end
  end


  private

  def game_params
    params.require(:game).permit(:multi)
  end

  def pick_a_random_poi_of_the_theme
    @pois = @theme.theme_pois
    @list_poi_on_going_game = []
    @pois.each do |poi|
      @list_poi_on_going_game << (poi.poi_id)
    end
    first_poi = @list_poi_on_going_game.first
  end

  def total_score_calculation
    total_score = 0
    table_poi = []
    @answers.each do |answer|
      unless table_poi.include?(answer.poi)
        total_score += answer.score
      end
      table_poi << answer.poi

    end
    return total_score
  end

  def total_time_calculation
    total_time = 0
    @answers.each do |answer|
      total_time += answer.time_to_respond
    end
    return total_time
  end

  def total_distance_calculation
    total_distance = 0
    @answers.each do |answer|
      total_distance += answer.distance
    end
    return total_distance
  end


end
