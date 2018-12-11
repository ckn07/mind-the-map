class UsersController < ApplicationController
  def show
    @user = current_user
    @games = @user.games
    @games = @games.sort_by { |game| game.score_one }
    @games.uniq! { |game| game.theme }
  end

  def user_params
    params.require(:user).permit(:photo)
  end

end
