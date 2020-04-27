require 'date'

class ContentsController < ApplicationController
  def index # /contents
    # @contents = Content.expiring_next(current_user)
    # Fetches the expiring content from Content table for the current_user
    @contents = Content.where(country_code: current_user.country)
    # Calls the filter_content method below to access the filters on dashboard
    filter_content
    # Defines available params for the filters
    @params = params.permit(:category, :imdb_rating, :genre)
    # Defines available genres for the genre filter
    @genres = ["Action", "Animation", "Crime", "Comedy", "Documentary", "Drama",
               "Family", "Horror", "Music", "Romance", "Sci-Fi", "War"]

    # Splits @contents by sorted calendar week for display on dashboard
    @weeks = @contents.group_by { |content| content.expiration_date.cweek }.sort
  end

  def filter_content
    # Sets @contents to show only titles for the selected category from movie,
    # TV show or all
    if params[:category]
      @contents = @contents.where(category: params[:category])
    end

    # Selects titles from @contents that have higher rating the rating selected
    # by the user - this is cumulative with the above
    if params[:imdb_rating]
      @contents = @contents.select do |content|
        content[:imdb_rating].to_f > params[:imdb_rating].to_f
      end
    end

    # Selects titles from @contents that have at genre selected by the user
    # this is cumulative with the above
    if params[:genre]
      @contents = @contents.select do |content|
        !content[:genre].nil? && content[:genre].include?(params[:genre])
      end
    end
  end

  def show #contents/id
    # Fetches the show page for a given title id
    @content = Content.find(params[:id])
  end
end
