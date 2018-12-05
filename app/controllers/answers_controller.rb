class AnswersController < ApplicationController
  # def show
  # end

  # def index
  # end

  def create
    @answer = Answer.new(answer_params)
    @game = Game.find(params[:game_id])
    @poi = Poi.find(params[:poi_id])
    @answer.game = @game
    @answer.poi = @poi
    @answer.user = current_user
    if @answer.save
      redirect_to game_poi(@poi + 1)
    else

    end
  end

  private

  def answer_params
    params.require(:answer).permit(:latitude, :longitude, :score, :time_to_respond)
  end
end



Réduire 
Zone de message

Envoyer un message à Benoit
