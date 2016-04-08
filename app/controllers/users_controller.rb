class UsersController < ApplicationController

  # before_action :authenticate_user! << not necessary here, blocks registration; use in groups, members, measurements controllers
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:gym_name, :address, :email, :password, :password_confirmation)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(id: @user.id)
    else
      flash[:error] = "Unable to register user. Please check input fields and try again."
      render :new
    end
  end

  def edit
    @user = @current_user
    @user = User.find_by id: params[:id]
  end

  def update
    @user = @current_user
    @user = User.find_by id: params[:id]
    @user.gym_name = params[:user][:gym_name]
    @user.address = params[:user][:address]
    @user.email = params[:user][:email]
    if @user.id == session[:user_id]
      if @user.save
        redirect_to user_path(id: @user.id)
      else
        render :edit
      end
    end
  end

  def delete
  end
end
