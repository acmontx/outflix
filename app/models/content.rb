class Content < ApplicationRecord
  has_many :users, through: :user_contents

  # Method to get the expiring titles for the user's country
  def self.expiring_next(user)
    # Initializes the FetchTitleService
    @service = FetchTitlesService.new
    # Calls the get_expiring_content method on the service for the user's country
    @service.get_expiring_content(user.country)
    # Fetches titles from database for user country when user clicks on dashboard
    @contents = Content.where(country_code: user.country)
  end

  # Hack for the calendar range to work
  def start_time
    Date.today
  end
end
