class AnswersController < ApplicationController
  before_action :set_game, only: [:show, :create]
  def show
    @answer = Answer.find(params[:id])
    @poi = Poi.find(params[:poi_id])
    @markers = [{
        lng: @poi.longitude,
        lat: @poi.latitude,
        color: "#08c299" },
                {
        lng: @answer.longitude,
        lat: @answer.latitude,
        color:  "#860CE6"
      }]
    @remaining_poi = whats_pois_are_left
    @next_poi = @remaining_poi.sample

  end

  # def index
  # end

  def create
    @answer = Answer.new
    @poi = Poi.find(params[:poi_id])
    @latitude_user = params[:answer][:latitude]
    @longitude_user = params[:answer][:longitude]
    @time_to_respond = params[:answer][:time_to_respond].to_f / 1000
    # @time_to_respond_formatted = (@time_to_respond / 1000).round(2)
    @poi_coordinates = "[#{@poi.latitude},#{@poi.longitude}]"
    @user_coordinates = "[#{@latitude_user},#{@longitude_user}]"
    @distance = methode_calcul_distance
    @score = score_calculation
    @answer.game_id = @game.id
    # # a voir au niveau de la view pour remonter les coordonnées
    @answer.poi_id = @poi.id
    @answer.user_id = current_user.id
    @answer.score = @score
    @answer.longitude = @longitude_user
    @answer.latitude = @latitude_user
    @answer.distance = @distance
    @answer.time_to_respond = @time_to_respond
    @answer.save!
    redirect_to game_poi_answer_path(@game.id,@poi.id,@answer.id)

  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def answer_params
    params.require(:answer).permit(:latitude, :longitude, :score, :time_to_respond)
  end

  def methode_calcul_distance
    (Geocoder::Calculations.distance_between(@poi_coordinates, @user_coordinates) * 1000).to_i
  end

  def score_calculation
    max_score = 10_000 # per criteria
    distance_limit = 3_000 # meters
    time_limit = 10 # seconds
    10_000 - (@distance * max_score / distance_limit) + 10_000 - (@time_to_respond * max_score / time_limit)
  end

  def whats_pois_are_left
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
  end


end
