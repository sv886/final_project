class MembersController < ApplicationController

  before_action :authenticate_user!
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def index
  end

  def show
    @member = Member.find_by id: params[:id]
    @user = @current_user
    @group = @member.group
  end

  def new
    @group = Group.find_by id: params[:id]
    @member = Member.new
  end

  def create
    @user = @current_user
    @group = Group.find_by id: params[:id]
    @member = Member.new member_params
    if @member.save
      redirect_to user_path(id: @user.id)
    else
      flash[:error] = "Unable to add member. Please check input fields and try again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def member_params
     params.require(:member).permit(:group_id, :member_first_name, :member_last_name, :age, :gender)
  end
end
