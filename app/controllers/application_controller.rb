class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?

  def authenticate_user!
    redirect_to sign_in_path unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end
end
