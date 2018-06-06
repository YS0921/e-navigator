class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update]

  def index
  end

  def edit
  end

  def update
    if @user.save
      redirect_to("/")
    else
      @user.save
      render("users/edit")
    end
  end

end
