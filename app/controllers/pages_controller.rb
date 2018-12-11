class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @city = City.first
    @themes = @city.themes
    render 'themes/index'
  end

  def leaderboard
    @users = User.all
    @cities = City.all
    @themes = Theme.all
    @games = Game.all

    # if params[:city_name].present? && params[:theme_name].present?
    #   @games = Game.where(theme_id:

        # pour un theme , soritr tous les scores
        @game_paris = Game.where(theme_id: params[:theme])
        raise


  end

end

