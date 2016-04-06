class UsersController < ApplicationController

  # before_action :authenticate_user! << not necessary here, blocks registration, use in groups, members, measurements controllers

  def show
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
