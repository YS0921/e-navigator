class InterviewMailer < ApplicationMailer
  default from: ENV['ADDRESS']

  def apply(user, interviewer)
    @user = user
    @url = "https://e-navigator-ys0921.herokuapp.com/users/#{@user.id}/interviews"
    mail(to: interviewer.email, subject: "面接希望日が決まりました")
  end

  def notify(user, interviewer)
    @user = user
    @interviewer = interviewer
    @interview_datetime = @user.interview.find_by(status: :approval).datetime_print
    mail(to: @user.email, cc: interviewer.email, subject: "面接日時が確定しました")
  end
end
