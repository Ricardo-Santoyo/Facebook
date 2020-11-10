class UserMailer < ApplicationMailer
  default from: 'connectU@email.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to connectU')
  end
end
