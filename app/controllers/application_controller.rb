class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # Change this to redirect user after Authorization
  def after_sign_in_path_for(resource)
    posts_url
  end

end
