require 'date'

class ContentsController < ApplicationController

  @category_filter = nil
  @rating_filter = nil

  def index
    @service = FetchTitlesJson.new

    # @countries = @service.getCountries
    country = current_user.country

    @content = @service.getExpiringContent(country)
    @all = @content.clone

    groupByWeek

    # filterCategory("movie")
    filterByRating(0)
  end

  def groupByWeek
   @weeks = @content.group_by { |item| item[:expiration_date].cweek }
  end

  def filter
    @content = @all.clone

    if @category_filter != nil
      @content = @content.select { |cont| cont[:category] == @category_filter }
    end

    if @rating_filter != nil
      @content = @content.select { |cont| cont[:rating] >= @rating_filter }
    end

    groupByWeek
  end

  def filterCategory (category)
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
    @service = FetchTitlesJson.new

    @content = @service.getContentDetails(params[:id])
  end
end
