require 'byebug'
require 'date'

class ContentsController < ApplicationController

  def index
    @service =FetchTitlesJson.new

    # @countries = @service.getCountries
    country = current_user.country

    @content = @service.getExpiringContent(country)

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

  # def show
  # end

  # def edit
  # end

end
