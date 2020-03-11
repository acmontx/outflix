# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/expiring
  def expiring
    user = User.first

    UserMailer.with(user: user).expiring
  end

  def dashboard
    user = User.first

    UserMailer.with(user: user).dashboard
  end
end
