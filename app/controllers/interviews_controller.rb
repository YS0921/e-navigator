class InterviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @interviews = current_user.interview.all.order(datetime: :asc)
  end

  def edit
    @interview = Interview.find_by(id: params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_params)
      redirect_to("/users/#{current_user.id}/interviews", notice: "面接が編集されました")
    else
      render(:edit, notice: @interview.errors.full_messages)
    end
  end

  def destroy
    Interview.find(params[:id]).destroy
    redirect_to("/users/#{current_user.id}/interviews", notice: "面接を削除しました")
  end

  def new
    @interview = Interview.new
  end

  def create
    Interview.create(interview_params)
    redirect_to("/users/#{current_user.id}/interviews", notice: "面接が作成されました")
  end

  def interview_params
    params.require(:interview).permit(:datetime).merge(user_id: current_user.id)
  end
end
