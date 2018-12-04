class UsersController < ApplicationController
  def show
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end
