class GroupsController < ApplicationController

  before_action :authenticate_user!
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @user = @current_user
    @group = Group.new params.require(:group).permit(:class_time, :coach_first_name, :coach_last_name)
    @group.user = @current_user
    if @group.save
      redirect_to user_path(id: @user.id)
    else
      flash[:error] = "Unable to add class. Please check input fields and try again."
      render :new
    end
  end

  def show
    @user = @current_user
    @group = Group.find_by id: params[:id]
  end

  def edit
    @user = @current_user
    @group = Group.find_by id: params[:id]
  end

  def update
    @user = @current_user
    @group = Group.find_by id: params[:id]
    @group.class_time = params[:group][:class_time]
    @group.coach_first_name = params[:group][:coach_first_name]
    @group.coach_last_name = params[:group][:coach_last_name]
    if @group.user.id == session[:user_id]
      if @group.save
        redirect_to user_path(id: @user.id)
      else
        render :edit
      end
    end
  end

  def delete
  end
end
