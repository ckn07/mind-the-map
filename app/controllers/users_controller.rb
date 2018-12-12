require 'awesome_print'
class UsersController < ApplicationController
  def show
    puts "je Passe dans SHOW"
    @user = current_user
    @games = @user.games
    puts "je Passe dans SHOW 2"
    @games = @games.sort_by { |game| game.score_one || game.score_two || 0}.reverse
    @games.uniq! { |game| game.theme }

    @challenges = @user.games
    @challenges = @challenges.partition do |challenge|
      challenge.score_one.nil? || challenge.score_two.nil?
    end
    puts "------------------"
    ap @challenges
    puts "------------------"
    @challenges = @challenges[1].partition do |challenge|
      if challenge.user_one == @user
        challenge.score_one > challenge.score_two
      else
        challenge.score_two > challenge.score_one
      end
    end
  end

  def user_params
    params.require(:user).permit(:photo)
  end

private


  # def text_if_blank(game)
  #   if game.score_one && game.score_two == nil
  #     return "Go play"
  #   elsif game.score_one == nil && game.score_two != nil
  #     return game.score_two
  #   else
  #     return game.score_one
  #   end
  # end
end
