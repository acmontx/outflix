
class ContentsController < ApplicationController

  def index
    @service =FetchTitles.new

    country = current_user.country
    @content = @service.getExpiringContent(country)
  end

  def show
  end

  def edit
  end

  def setup
    # Grab my list titles
    # @nf_login

    # Fetch titles per country
    # @service = FetchTitles.new
    # country = current_user.country.downcase
    # countries = @service.getCountries
    # countries_codes = countries.reduce(Hash.new, :merge)
    # country_code = countries_codes[country].to_i

    # @titles_list = @service.getTitlesPerCountry(country_code)
  end

  def browse_list
  end

  # private

  # def contents_params
  #   params.require(:content).permit(:nf_email, :nf_pass)
  # end
end
