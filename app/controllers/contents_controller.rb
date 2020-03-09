require 'date'

class ContentsController < ApplicationController
  @category_filter = nil
  @rating_filter = nil

  def index
    @service = FetchTitlesService.new
    @service.get_expiring_content(current_user.country)
    @contents = Content.where(country_code: current_user.country)

    @contents = @contents.where(category: 'movie') if params[:category] == 'movie'
    @contents = @contents.where(category: 'series') if params[:category] == 'series'

    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort
  end

  def show
    @contents = Content.where(country_code: current_user.country)
    @content = Content.find(params[:id])
  end
end
