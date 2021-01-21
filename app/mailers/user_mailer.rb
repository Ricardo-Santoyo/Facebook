class UserMailer < ApplicationMailer
  default from: 'connectU@email.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to connectU')
  end
end
