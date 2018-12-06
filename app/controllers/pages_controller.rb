class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @city = City.first
    @themes = @city.themes
    render 'themes/index'
  end
end
