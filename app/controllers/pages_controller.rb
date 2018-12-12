class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @city = City.first
    @themes = @city.themes
    render 'themes/index'
  end

  def leaderboard
    @themes = Theme.all
    @games = {}

    @themes.each do |theme|
      games = Game
              .select("
                    games.*,
                    CASE WHEN score_two IS NULL THEN score_one
                         WHEN score_one >= score_two THEN score_one
                         ELSE score_two
                    END
                    AS score
                  ")
              .where(theme_id: theme.id)
              .order("score DESC")
              .limit(20)
      @games[theme.id] = games
    end
  end
end
