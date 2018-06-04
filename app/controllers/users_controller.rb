class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def update
    super
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.birthday = params[:birthday]
    @user.gender = params[:gender]
    @user.school = params[:school]
    if @user.save
      redirect_to("/")
    else
      @user.save
      render("users/edit")
    end
  end
end
