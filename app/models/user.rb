class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # Callback to ensure that countries are saved downcased
  before_save :downcase_country
  # Callback to send a welcome email upon signup
  after_create :send_welcome_email

  # Ensures that countries are saved downcased to avoid duplicates
  def downcase_country
    self.country.downcase!
  end

  def send_text_message
    # If there's no phone number, leave the method
    return unless phone_number.present?
    # Initializes the TwilioService
    @twilio = TwilioService.new

    # Calls the class method expiring_next and selects the content's titles
    titles = Content.expiring_next(self).pluck(:title)
    # Calls the to_sentence method on the titles array and limits the resulting
    # string to 150 chars
    message = titles.to_sentence.truncate(150)
    message = "These shows are leaving netflix soon: #{message} " +
              "Check the full list at https://outflix.rocks/contents"
    # Calls the send_text method from TwilioService to send the SMS
    @twilio.send_text(message, phone_number)
  end

  # Sends welcome emal to user
  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end

  # Sends newsletters to user
  def send_newsletter
    UserMailer.with(user: self).newsletter.deliver_now
  end
end
