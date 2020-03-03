
class ContentsController < ApplicationController

  def index
    @service =FetchTitles.new

    country = current_user.country
    @content = @service.getExpiringContent(country)
  end

  def show
  end

  def edit
  end

  def setup
    @service = FetchTitles.new
    country = current_user.country
    country_id = @service.getCountries[country]
    @titles_list = @service.getTitlesPerCountry(country_id)
  end
end
