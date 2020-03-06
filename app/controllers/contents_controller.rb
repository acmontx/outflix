require 'date'

class ContentsController < ApplicationController

  @category_filter = nil
  @rating_filter = nil

  def index
    @service = FetchTitlesService.new
    @service.get_expiring_content(current_user.country)
    @contents = Content.where(country_code: current_user.country)
    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort

    @all = @content.clone

    # groupByWeek

    # filterCategory("movie")
    # filterByRating(4)
  end

  def groupByWeek
    @weeks = @contents.group_by { |item| item[:expiration_date].cweek }

  end

  def filter
    @content = @all.clone

    if @category_filter != nil
      @content = @contents.select { |content| content[:category] == @category_filter }
    end

    if @rating_filter != nil
      @content = @contents.select { |content| content[:netflix_rating] >= @rating_filter }
    end

    groupByWeek
  end

  def filterCategory(category)
    @category_filter = category

    filter
  end

  def filterByRating(rating)
    @rating_filter = rating

    filter
  end

  def resetFilters
    @category_filter = nil
    @rating_filter = nil

    filter
  end

  def show
    @content = Content.find(params[:id])
  end
end
