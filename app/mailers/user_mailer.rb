class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.expiring.subject
  #
  def expiring
    @user = params[:user] # Instance variable => available in view

    mail(to: @user.email, subject: 'Expiring Netf..x Titles!')
    # This will render a view in `app/views/user_mailer`!
  end

  def dashboard
    @user = params[:user]
    @service = FetchTitlesService.new
    @service.get_expiring_content(@user.country)
    @contents = Content.where(country_code: @user.country)

    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort

    mail(to: @user.email, subject: 'Dashboard')
  end
end
