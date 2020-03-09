class Content < ApplicationRecord
  has_many :users, through: :user_contents

  # serialize :details, JSON
  # serialize :cast, Array


  # Hack for the calendar range to work
  def start_time
    Date.today
  end
end
