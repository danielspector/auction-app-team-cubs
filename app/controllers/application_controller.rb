class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def login_required
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def login(user)
    session[:user_id] = user.id
  end 

  def logout
    reset_session
  end 

  def authorized_to_bid?(seller) 
    current_user != seller
  end
  helper_method :authorized_to_bid?

  def authorized_to_edit?(seller)
    current_user == seller
  end 
  helper_method :authorized_to_edit?

  def auction_active?(auction)
    auction.end_time > Time.now if auction.end_time 
  end 
  helper_method :auction_active?

  def time_left(auction)
    Time.now - auction.end_time
  end 
  helper_method :time_left
end
