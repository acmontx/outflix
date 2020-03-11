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

  def send_newsletter
    UserMailer.with(user: self).newsletter.deliver_now
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end
end
