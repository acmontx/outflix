class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :send_expiring_email

  #private

  def send_expiring_email
    UserMailer.with(user: self).expiring.deliver_now
  end
end
