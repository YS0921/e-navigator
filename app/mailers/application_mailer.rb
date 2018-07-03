class ApplicationMailer < ActionMailer::Base
  default from: ENV['ADDRESS']
  layout 'mailer'
end
