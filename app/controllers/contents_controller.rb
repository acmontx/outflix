require 'date'

class ContentsController < ApplicationController

  @category_filter = nil
  @rating_filter = nil

  def index
    # @service = NetflixContentRepo.new

    # ------- FAKE JSON
    # @service = FetchTitlesJsonService.new
    # country = current_user.country    # "pt"
    # @content = @service.getExpiringContent(country)




    @contents = Content.all
    @weeks = @contents.group_by { |content| content.expiration_date.cweek }

    # 4 real JSON
    @service = FetchTitlesService.new
    country = current_user.country
    @service.getExpiringContent(country)


    # @all = @content.clone

    #groupByWeek

    # filterCategory("movie")
    # filterByRating(0)

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



  def setup
    # Fetch titles per country
    # @service = FetchTitles.new
    # country = current_user.country.downcase
    # countries = @service.getCountries
    # countries_codes = countries.reduce(Hash.new, :merge)
    # country_code = countries_codes[country].to_i

    # @titles_list = @service.getTitlesPerCountry(country_code)
  end


  def show
    @content = Content.find(params[:id])
  end
end
