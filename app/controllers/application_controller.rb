class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def login_required
    redirect_to login_path unless logged_in?
  end

  helper_method :login_required

  def logged_in?
    !!session[:user_id]
  end

  helper_method :logged_in?
end
