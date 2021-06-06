class ApplicationMailer < ActionMailer::Base
  default from: ENV["shadowsCakesEmail"]
  layout 'mailer'
end
