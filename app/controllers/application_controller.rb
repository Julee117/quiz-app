class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :is_admin?

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    logged_in? && current_user.admin?
  end
end
