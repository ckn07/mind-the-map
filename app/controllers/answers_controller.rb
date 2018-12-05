class AnswersController < ApplicationController
  # def show
  # end

  # def index
  # end

  def create

    @answer = Answer.new(answer_params)
    @game = Game.find(params[:game_id])
    @poi = Poi.find(params[:poi_id])
    @poicoordinates = "[#{@poi.latitude},#{@poi.longitude}]"
    @inputuser = ""
    @score = calculate_score(@inputuser, @poicoordinates)
    @answer.game = @game
    # a voir au niveau de la view pour remonter les coordonnées
    @answer.coordinate = @poi
    @answer.user = current_user
    if @answer.save
      redirect_to game_poi
    else

    end
  end

  private

  def answer_params
    params.require(:answer).permit(:latitude, :longitude, :score, :time_to_respond)
  end
  def calcul_score(inputuser, poicoordinates)
    # caclul de la distance
    Geocoder::Calculations.distance_between(inputuser,poicoordinates) ""
    # calcul du temps de reponse

    # multiplication des pains et retour

  end

end
