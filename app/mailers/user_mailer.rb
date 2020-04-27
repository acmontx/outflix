class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.expiring.subject
  #
  def welcome_email
    # With the instance variable, the user will be available in the view
    @user = params[:user]

    mail(to: @user.email, subject: 'Welcome to Outflix!')
    # This will render a view in `app/views/user_mailer`
  end

  def newsletter
    # Sets the user and makes it avaialable in the view
    @user = params[:user]
    # Calls the expiring_next method on Content model to get the expiring titles
    # for the user's country
    @contents = Content.where(country_code: @user.country)
    # Organizes @contents by calendar week, sorted
    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort

    mail(to: @user.email, subject: 'Outflix newsletter!')
  end
end
