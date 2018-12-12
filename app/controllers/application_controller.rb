class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb

    # pour la demo uniquement, permet de forcer l'email et le password.
    # si le user se deconnecte, il ne pourra plus se reconnecter
    # a commenter post demo
    if controller_name == "registrations" && action_name == "create"
      params[:user][:email] = "fake-#{params[:user][:username]}@mail.com"
      params[:user][:password] = "123456"
      params[:user][:password_confirmation] = "123456"
    end

    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :photo, :address])
  end

  # def default_url_options
  #   { host: ENV["HOST"] || "localhost:3000" }
  # end
end
