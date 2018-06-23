class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :update]
  before_action :set_interview, only: [:edit, :update, :destroy]

  def index
    @interviews = @user.interview.all.order(datetime: :asc)
    @interviews_without_approval = @user.interview.where.not(status: "approval").order(datetime: :asc)
    @approved_interview = @user.interview.find_by(status: "approval")
  end

  def edit
  end

  def update
    @user.interview.all.update(status: 2)
    if @interview.update(interview_params)
      redirect_to user_interviews_path, notice: "面接が編集されました"
    else
      render :edit, notice: @interview.errors.full_messages
    end
  end

  def destroy
    @interview.destroy
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end
end
