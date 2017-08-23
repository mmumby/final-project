class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :disable_nav, only: [:new, :create]

  # disable nav bar on welcome/login/register/password page
  def disable_nav
    @disable_nav = true
  end
  # Change this to redirect user after Authorization
  def after_sign_in_path_for(resource)
    "/posts?order=available"
  end

  def after_sign_out_path_for(resource)
    new_user_session_url
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end

end
