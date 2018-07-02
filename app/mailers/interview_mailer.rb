class InterviewMailer < ApplicationMailer
  default from: "example@gmail.com"

  def request(user, approver)
    @user = user
    @url = "http://192.168.33.10:3000/users/#{@user.id}/interviews"
    mail(to: approver.email, subject: "面接希望日が決まりました")
  end
end
