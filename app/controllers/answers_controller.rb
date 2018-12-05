class AnswersController < ApplicationController
  # def show
  # end

  # def index
  # end

  def create
    @game = Game.find(params[:game_id])
    @poi = Poi.find(params[:poi_id])
    @latitude_user = params[:answer][:latitude]
    @longitude_user = params[:answer][:longitude]
    @time_to_respond = params[:answer][:time_to_respond]

    @poi_coordinates = "[#{@poi.latitude},#{@poi.longitude}]"
    @user_coordinates = "[#{@latitude_user},#{@longitude_user}]"
    @distance = methode_calcul_distance
    @score = 1000
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
  def methode_calcul_distance
    distance_m = (Geocoder::Calculations.distance_between(@poi_coordinates, @user_coordinates)*1000).to_i
  end
  # def score(time,distance)
  #   if distance < 3000
  #     (5000 - time) * distance
  #   elsif


  #   return 0
  #   end



end
