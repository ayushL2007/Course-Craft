include ActionController::Cookies

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_name]
  end

  def authenticate_user!
    redirect_to new_user_path, alert: "Please log in first" unless current_user
  end
end
