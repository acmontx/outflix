class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  before_save :downcase_country
  after_create :send_welcome_email

  def downcase_country
    self.country.downcase!
  end

  def send_text_message
    return unless phone_number.present?

    @twilio = TwilioService.new

    titles = Content.expiring_next(self).pluck(:title)
    message = titles.to_sentence.truncate(150)
    message = "These shows are leaving netflix soon: #{message} Check the full list at https://outflix.rocks/contents"

    @twilio.send_text(message, phone_number)
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end
end
