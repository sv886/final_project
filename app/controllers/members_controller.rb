class MembersController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @group = Group.find_by id: params[:id]
    @member = Member.new
  end

  def create
    @group = Group.find_by id: params[:id]
    @member = Member.new member_params
    if @member.save
      redirect_to group_path(id: @group.id)
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
     params.require(:member).permit(:member_first_name, :member_last_name, :age, :gender)
  end
end
