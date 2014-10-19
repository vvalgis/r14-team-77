class BeeMailer < ActionMailer::Base
  default from: "queen-be@example.com"

  def activation_needed_email(bee)
    @bee = bee
    @url  = activate_bee_url(bee.activation_token)
    mail to: bee.email, subject: "Welcome to Datacombs"
  end

  def activation_success_email(bee)
    @bee = bee
    @url  = new_bee_session_url
    mail to: bee.email, subject: "Your account is now activated"
  end
end
