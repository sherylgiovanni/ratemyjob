class UserMailer < ApplicationMailer
  def forgot_password_email(user)
    @user = user
    mail(to: @user.email, subject: 'Change your password')
  end
end
