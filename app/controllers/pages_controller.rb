class PagesController < ApplicationController
  # Skips the need to log in on the landing page
  skip_before_action :authenticate_user!, only: [:home]

  def home # landing page
  end
end
