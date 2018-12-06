class AnswersController < ApplicationController
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
  end

  # def index
  # end

  def create
    @answer = Answer.new
    @game = Game.find(params[:game_id])
    @poi = Poi.find(params[:poi_id])
    @latitude_user = params[:answer][:latitude]
    @longitude_user = params[:answer][:longitude]
    @time_to_respond = params[:answer][:time_to_respond].to_i
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

  def answer_params
    params.require(:answer).permit(:latitude, :longitude, :score, :time_to_respond)
  end

  def methode_calcul_distance
     (Geocoder::Calculations.distance_between(@poi_coordinates, @user_coordinates)*1000).to_i
  end

  def score_calculation
    if @distance < 3000
      (5000 - @time_to_respond) * @distance
    else
      return 0
    end
  end

end
