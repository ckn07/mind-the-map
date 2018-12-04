class GamesController < ApplicationController

  # affichage de la page finale du jeu
  def show
    @user = current_user
    @game = Game.find(params[:id])
  end

  def create
  end

end
