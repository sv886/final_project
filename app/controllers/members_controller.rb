class MembersController < ApplicationController

  before_action :authenticate_user!
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def index
    @user = @current_user
    @members = @user.members
  end

  def show
    @user = @current_user
    @member = Member.find_by id: params[:id]
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
    @member.user_id = @user.id
    if @member.save
      redirect_to member_path(id: @member.id)
    else
      flash[:error] = "Unable to add member. Please check input fields and try again."
      render :new
    end
  end

  def edit
    @member = Member.find_by id: params[:id]
  end

  def update
    @user = @current_user
    @member = Member.find_by id: params[:id]
    @member.user_id = @user.id
    if @user.id == session[:user_id]
      if @member.update update_member_params
        redirect_to member_path(id: @member.id)
      else
        render :edit
      end
    end
  end

  def delete
  end

  def member_params
     params.require(:member).permit(:group_id, :member_first_name, :member_last_name, :age, :height_inches, :gender, :notes)
  end

  def update_member_params
     params.require(:member).permit(:user_id, :group_id, :member_first_name, :member_last_name, :age, :height_inches, :gender, :status, :notes)
  end
end
