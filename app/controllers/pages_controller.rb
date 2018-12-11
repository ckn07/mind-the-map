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

    # workaround of when the page loads, there is no option selected
    if params[:theme].present?
      # @city = City.find(params[:city])
      # @theme = Theme.find(params[:theme])
      # @games_unsorted = @theme.games
      @games = Game.where(theme_id: params[:theme])
    else
      @games = Game.all
    end

    @games = @games.
      select("
          games.*,
          CASE WHEN score_two IS NULL THEN score_one
               WHEN score_one >= score_two THEN score_one
               ELSE score_two
          END
          AS score
        ").
      order("score DESC")
  end
end
