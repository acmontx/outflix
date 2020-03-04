class ContentsController < ApplicationController

  def index
    @service =FetchTitles.new

    @countries = @service.getCountries
    country = current_user.country

    @content = @service.getExpiringContent(country)

  end

  def show
    @content = Content.find_by(params[:id])
  end

  def edit
  end

  private

  # def content_params
  #   params.require(:content).permit()
  # end
end
