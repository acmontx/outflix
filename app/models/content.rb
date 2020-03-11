class Content < ApplicationRecord
  has_many :users, through: :user_contents

  def self.expiring_next(user)
    @service = FetchTitlesService.new
    @service.get_expiring_content(user.country)
    @contents = Content.where(country_code: user.country)
  end

  # Hack for the calendar range to work
  def start_time
    Date.today
  end
end
