class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @city = City.first
    @themes = @city.themes
    render 'themes/index'
  end

  def leaderboard
    @cities = City.all
    @themes = Theme.all

    @theme = Theme.find_by(name: params[:theme])
    @games_unsorted = @theme.games
    @games = @games_unsorted.sort_by { |game| game.score_one }.reverse
  end
end

