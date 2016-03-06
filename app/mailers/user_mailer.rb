class UserMailer < ApplicationMailer
  default :from => "roman95roman@gmail"

  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered")
  end
end
