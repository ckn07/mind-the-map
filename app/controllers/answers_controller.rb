class AnswersController < ApplicationController
  def show
  end

  def index
    @answers = Answer.all
  end
end
