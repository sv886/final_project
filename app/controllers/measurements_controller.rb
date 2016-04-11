class MeasurementsController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def index
  end

  def show
  end

  def new
    @measurement = Measurement.new
  end

  def create
    @member = Member.find_by id: params[:member_id]
    @measurement = Measurement.new measurement_params
    @measurement.member_id = @member.id
    if @measurement.save
      redirect_to member_path(id: @member.id)
    else
      flash[:error] = "Unable to add measurement. Please check input fields and try again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def measurement_params
     params.require(:measurement).permit(:member_id, :photo, :weight, :bicep_circ, :forearm_circ, :chest_circ, :waist_circ, :abdomen_circ, :hips_circ, :thigh_circ, :calf_circ, :bmi, :body_fat_percentage)
  end

end
