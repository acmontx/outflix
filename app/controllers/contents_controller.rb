require 'date'

class ContentsController < ApplicationController
  def index
    @service = FetchTitlesService.new
    @service.get_expiring_content(current_user.country)
    @contents = Content.where(country_code: current_user.country)

    filter_content
    @updated
    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort

    @params = params.permit(:category, :imdb_rating, :genre)
    @genres = ["Action", "Animation", "Crime", "Comedy", "Documentary", "Drama", "Family", "Horror", "Music", "Romance", "Sci-Fi", "War" ]
    end

  def filter_content
    if params[:category]
      @contents = @contents.where(category: params[:category])
    end

    if params[:imdb_rating]
      @contents = @contents.select { |content| content[:imdb_rating].to_f > params[:imdb_rating].to_f }
    end

    if params[:genre]
      @contents = @contents.select { |content| !content[:genre].nil? && content[:genre].include?(params[:genre])  }
    end
  end

  def show
    @contents = Content.where(country_code: current_user.country)
    @content = Content.find(params[:id])
  end
end
