class WelcomeController < ApplicationController

  before_action :authenticate_user!
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def index
    redirect_to user_path(id: @current_user.id)
  end
end
