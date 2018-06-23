class InterviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interview.all.order(datetime: :asc)
    @approved_interview = @user.interview.find_by(status: "approval")
  end

  def edit
    @interview = Interview.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @user.interview.all.update(status: 2)
    @interview = Interview.find(params[:id])
    if @interview.update(interview_params)
      redirect_to user_interviews_path, notice: "面接が編集されました"
    else
      render :edit, notice: @interview.errors.full_messages
    end
  end

  def destroy
    Interview.find(params[:id]).destroy
    redirect_to user_interviews_path, notice: "面接を削除しました"
  end

  def new
    @interview = Interview.new
  end

  def create
    current_user.interview.create(interview_params)
    redirect_to user_interviews_path, notice: "面接が作成されました"
  end

  def interview_params
    params.require(:interview).permit(:datetime, :status)
  end
end
