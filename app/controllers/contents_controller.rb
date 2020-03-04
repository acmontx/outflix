require 'date'

class ContentsController < ApplicationController

  @category_filter = "ALL"

  def index
    @service = FetchTitlesJson.new

    # @countries = @service.getCountries
    country = current_user.country

    @content = @service.getExpiringContent(country)
    @all = @content.clone

    groupByWeek

  end

  def groupByWeek
   @weeks = @content.group_by { |item| item[:expiration_date].cweek }
   @weeks.keys

   @week33 = @weeks[33]
   @week34 = @weeks[34]
   @week35 = @weeks[35]
   @week36 = @weeks[36]
  end

  def filter
    @content = @all.clone

    if @category_filter != "ALL"
      @content = @content.select { |cont| cont[:category] == @category_filter }
    end
    groupByWeek

  end

  def filterSeries #example to test filter
    @category_filter = "series"

    filter
  end

  def show

    @service = FetchTitlesJson.new

    @content = @service.getContentDetails(params[:id])

  end

  # def edit
  # end
end
