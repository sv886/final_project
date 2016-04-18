class GroupsController < ApplicationController

  before_action :authenticate_user!
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def index
    @groups = Group.all
  end

  def graphs
    @groups = @current_user.groups
    @members = @current_user.members
  end

  def show
    @user = @current_user
    @group = Group.find_by id: params[:id]
    @members = @group.members
    @active_members = @members.select { |member| member.status == "Active" }
    @measurements = @group.measurements
  end

  def new
    @group = Group.new
  end

  def create
    @user = @current_user
    @group = Group.new group_params
    @group.user = @current_user
    if @group.save
      redirect_to user_path(id: @user.id)
    else
      flash[:error] = "Unable to add class. Please check input fields and try again."
      render :new
    end
  end

  def edit
    @group = Group.find_by id: params[:id]
  end

  def update
    @user = @current_user
    @group = Group.find_by id: params[:id]
    if @user.id == session[:user_id]
      if @group.update group_params
        redirect_to user_path(id: @user.id)
      else
        render :edit
      end
    end
  end

  def delete
  end

  def group_params
     params.require(:group).permit(:class_time, :coach_first_name, :coach_last_name)
  end
end
