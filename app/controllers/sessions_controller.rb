class SessionsController < ApplicationController
  def new
  end

  def create
    # get user set session, then redirect
    email = params[:email]
    password = params[:password]
    # validate password
    user = User.find_by email: email
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to user_path
    else
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
