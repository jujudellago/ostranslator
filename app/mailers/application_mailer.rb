# :nocov:
class ApplicationMailer < ActionMailer::Base
  default from: "noreply@opensubtitles.org"
  layout "mailer"
end

# :nocov:
