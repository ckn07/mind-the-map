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
    @next_poi = @remaining_poi.first
    @counter_total = @list_poi_on_going_game.count
    @counter_remaining = @counter_total - @remaining_poi.count + 1
  end

  # browser.device.mobile? ? render('the_name_of_your_view', variant: :phone) : render('the_name_of_your_view')

  # def index
  # end

  def create
    @answer = Answer.new
    @poi = Poi.find(params[:poi_id])
    @game = Game.find(params[:game_id])
    @latitude_user = params[:answer][:latitude]
    @longitude_user = params[:answer][:longitude]
    @time_to_respond = params[:answer][:time_to_respond].to_f / 1000
    @poi_coordinates = "[#{@poi.latitude},#{@poi.longitude}]"
    @user_coordinates = "[#{@latitude_user},#{@longitude_user}]"
    @distance = methode_calcul_distance if @latitude_user.present? && @longitude_user.present?
    @score = score_calculation if @distance.present?
    @answer.game_id = @game.id
    @answer.poi_id = @poi.id
    @answer.user_id = current_user.id
    @answer.score = @score
    @answer.longitude = @longitude_user
    @answer.latitude = @latitude_user
    @answer.distance = @distance
    @answer.time_to_respond = @time_to_respond

    @poi_marker = { lng: @poi.longitude, lat: @poi.latitude }

    if @answer.save
      respond_to do |format|
        format.html { redirect_to game_poi_answer_path(@game.id, @poi.id, @answer.id) }
        format.js do
          @next_poi = whats_pois_are_left.first
        end
      end
    else
      @answer = Answer.create(poi: @poi, user: current_user, game: @game, longitude: @poi.longitude, latitude: @poi.latitude, distance: 0, time_to_respond: 10, score: 0)
      respond_to do |format|
        format.html { redirect_to game_poi_answer_path(@game.id, @poi.id, @answer.id) }
        format.js do
          @next_poi = whats_pois_are_left.first
        end
      end
    end
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
    max_score - (@distance * max_score / distance_limit) + max_score - (@time_to_respond * max_score / time_limit)
  end

  def whats_pois_are_left
    @theme = @game.theme
    @pois = @theme.theme_pois
    @list_poi_on_going_game = []
    @pois.each do |poi|
      @list_poi_on_going_game << poi.poi_id
    end
    @pois_already_answered = []
    @list_answers = Answer.where(game_id: @game, user: current_user)
    @list_answers.each do |poi|
      @pois_already_answered << poi.poi_id
    end

    return @list_poi_on_going_game - @pois_already_answered
  end


end
