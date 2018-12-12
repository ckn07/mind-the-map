class UsersController < ApplicationController
  def show
    @user = current_user
    @games = @user.games
    @games = @games.sort_by { |game| game.score_one || game.score_two
    if game.score_one && game.score_two == nil
      return "Go play"
    elsif game.score_one == nil && game.score_two != nil
      return game.score_two
    else
      return game.score_one
    end }
    @games.uniq! { |game| game.theme }
  end

  def user_params
    params.require(:user).permit(:photo)
  end

end
