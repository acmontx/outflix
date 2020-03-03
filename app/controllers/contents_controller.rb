
class ContentsController < ApplicationController

  def index
    @service =FetchTitles.new

    @countries = @service.getCountries
    country = current_user.country

    @content = @service.getExpiringContent(country)

  end

  # def show
  # end

  # def edit
  # end

end
