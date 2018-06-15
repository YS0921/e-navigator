class InterviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @interviews = current_user.interview.all.order(datetime: :asc)
  end

  def edit
    @interview = Interview.find_by(user_id: current_user.id)
  end

  def update
    @interview = Interview.find(params[:id])
    @interview.update(interview_params)
    if @interview.save
      flash[:notice] = "面接が編集されました"
      redirect_to("/interviews/#{@interview.id}/edit")
    else
      flash[:notice] = @interview.errors.full_messages
      render("interviews/#{@interview.id}/edit")
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to("/interviews")
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.save
    flash[:notice] = "面接が作成されました"
    redirect_to("/interviews")
  end

  def interview_params
    params.require(:interview).permit(:datetime).merge(user_id: current_user.id)
  end
end
