class ContentsController < ApplicationController

  def index
    @service = FetchTitles.new
    FetchTitles.getCountries
  end

  def show
  end

  def edit
  end

  def setup
    @service = FetchTitles.new
    country = current_user.country
    NetflixAPIService.call(request)
  end
end
