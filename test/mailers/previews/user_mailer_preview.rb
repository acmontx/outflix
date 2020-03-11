# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/expiring
  def welcome_email
    user = User.first

    UserMailer.with(user: user).welcome_email
  end

  def newsletter
    user = User.first

    UserMailer.with(user: user).newsletter
  end
end
