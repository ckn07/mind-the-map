class UsersController < ApplicationController
  def show
    @user = current_user
    @games = @user.games
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end
