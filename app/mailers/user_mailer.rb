class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.expiring.subject
  #
  def welcome_email
    @user = params[:user] # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Outflix!')
    # This will render a view in `app/views/user_mailer`!
  end

  def newsletter
    @service = FetchTitlesService.new
    @service.get_expiring_content(params[:user].country)
    @contents = Content.where(country_code: params[:user].country)

    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort

    @user = params[:user]
    mail(to: @user.email, subject: 'Outflix newsletter!')
  end


end
