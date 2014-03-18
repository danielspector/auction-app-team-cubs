class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to "/"
    end
  end

  def destroy 
    logout 
    redirect_to '/'
  end 
end
