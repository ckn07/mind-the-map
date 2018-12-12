class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, :unless => :devise_controller?

  private
    # override the devise helper to store the current location so we can
    # redirect to it after loggin in or out. This override makes signing in
    # and signing up work automatically.
    def store_current_location
      store_location_for(:user, request.url)
    end

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
  private
    # override the devise method for where to go after signing out because theirs
    # always goes to the root path. Because devise uses a session variable and
    # the session is destroyed on log out, we need to use request.referrer
    # root_path is there as a backup
    def after_sign_out_path_for(resource)
      request.referrer || root_path
    end

  # def default_url_options
  #   { host: ENV["HOST"] || "localhost:3000" }
  # end
end
