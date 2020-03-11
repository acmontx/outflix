class Notification < ApplicationRecord
  belongs_to :user_content

  def send_newsletter
    UserMailer.with(user: self).newsletter.deliver_now
  end
end
