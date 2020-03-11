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
    @service = FetchTitlesService.new
    @service.get_expiring_content(params[:user].country)
    @contents = Content.where(country_code: params[:user].country)

    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort

    @user = params[:user]
    mail(to: @user.email, subject: 'Dashboard')
  end
end
