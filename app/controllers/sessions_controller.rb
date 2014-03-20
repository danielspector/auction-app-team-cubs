class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      login(user)
      redirect_to auctions_path
    else
      render :new
    end
  end

  def destroy 
    logout 
    redirect_to root_path
  end

  def authenticated?(user)
    user.password == params[:user][:password]
  end 
end
