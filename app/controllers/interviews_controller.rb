class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :update, :apply_mail]
  before_action :set_interview, only: [:edit, :update, :destroy]

  def index
    @interviews = @user.interview.all.order(datetime: :asc)
    @interviews_without_approval = @user.interview.where.not(status: :approval).order(datetime: :asc)
    @approved_interview = @user.interview.approval.last
    @not_approved_interview = @user.interview.where.not(status: :approval).last
  end

  def edit
  end

  def update
    @user.interview.all.update(status: :rejection)
    if @interview.update(interview_params)
      if @user != current_user
        InterviewMailer.notify(@user, current_user).deliver_later
        redirect_to({action: :index}, notice: "面接を承認しました")
      else
        redirect_to({action: :index}, notice: "面接が編集されました")
      end
    else
      render :edit, notice: @interview.errors.full_messages
    end
  end

  def destroy
    @interview.destroy
    redirect_to({action: :index}, notice: "面接を削除しました")
  end

  def new
    @interview = Interview.new
  end

  def create
    current_user.interview.create(interview_params)
    redirect_to({action: :index}, notice: "面接が作成されました")
  end

  def apply_mail
    @interviewer = User.find_by(mailer_params)
    InterviewMailer.apply(@user, @interviewer).deliver_later
    redirect_to({action: :index}, notice: "面接日程を申請しました")
  end

  private

    def interview_params
      params.require(:interview).permit(:datetime, :status)
    end

    def mailer_params
      params.permit(:email)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_interview
      @interview = Interview.find(params[:id])
    end
end
