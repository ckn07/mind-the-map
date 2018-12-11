class GamesController < ApplicationController

  # affichage de la page finale du jeu
  def show
    @game = Game.find(params[:id])
    @user = current_user
    @theme = @game.theme
    @pois = @theme.pois
    @answers = Answer.where(game_id: @game, user_id: current_user)
    @markers = @pois.map do |poi|
      {
        lng: poi.longitude,
        lat: poi.latitude,
        color: "#08c299"
      }
    end
    # les totales de la game ne doit pas etre calculé
    # sur une show... cette dernier doit juste chargé des données
    # le calcul et le storage va se faire dans la requete update
    if @game.user_one == @user
      @total_score = @game.score_one
    else
      @total_score = @game.score_two
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
    @answers = Answer.where(game_id: @game, user_id: current_user)

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
    first_poi = @list_poi_on_going_game.sample
  end

  def total_score_calculation
    total_score = 0
    @answers.each do |answer|
      total_score += answer.score
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
