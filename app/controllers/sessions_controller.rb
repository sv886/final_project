class SessionsController < ApplicationController
  def new
  end

  def create
    # get user set session, then redirect
    email = params[:email]
    password = params[:password]
    # validate password
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to user_path(id: user.id)
    else
      render :new, :flash => { :error => "Unable to login. Please check input fields and try again." }
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
