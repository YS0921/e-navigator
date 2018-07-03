class InterviewMailer < ApplicationMailer
  default from: "example@mail.com"

  def to_interviewer(user, interviewer)
    @user = user
    @url = "http://192.168.33.10:3000/users/#{user.id}/interviews"
    mail(to: interviewer.email, subject: "面接希望日が決まりました")
  end
end
