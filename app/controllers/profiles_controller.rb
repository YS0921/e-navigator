class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(profile_params)
      redirect_to({action: "edit"}, notice: "プロフィールを編集しました")
    else
      render :edit
    end
  end

  def profile_params
    params.require(:user).permit(:email, :name, :birthday, :gender, :school)
  end

end
