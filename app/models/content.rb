class Content < ApplicationRecord
  has_many :users, through: :user_contents

  # Hack for the calendar range to work
  def start_time
    Date.today
  end
end
