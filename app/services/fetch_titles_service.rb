require 'uri'
require 'net/http'
require 'openssl'

class FetchTitlesService
  # Constant with the countries supported by the UNOGS API
  API_COUNTRIES = {
    "21"=>{:code=>"ar", :name=>"Argentina"},
    "23"=>{:code=>"au", :name=>"Australia"},
    "26"=>{:code=>"be", :name=>"Belgium"},
    "29"=>{:code=>"br", :name=>"Brazil"},
    "33"=>{:code=>"ca", :name=>"Canada"},
    "307"=>{:code=>"cz", :name=>"Czech Republic"},
    "45"=>{:code=>"fr", :name=>"France"},
    "39"=>{:code=>"de", :name=>"Germany"},
    "327"=>{:code=>"gr", :name=>"Greece"},
    "331"=>{:code=>"hk", :name=>"Hong Kong"},
    "334"=>{:code=>"hu", :name=>"Hungary"},
    "265"=>{:code=>"is", :name=>"Iceland"},
    "337"=>{:code=>"in", :name=>"India"},
    "336"=>{:code=>"il", :name=>"Israel"},
    "269"=>{:code=>"it", :name=>"Italy"},
    "267"=>{:code=>"jp", :name=>"Japan"},
    "357"=>{:code=>"lt", :name=>"Lithuania"},
    "65"=>{:code=>"mx", :name=>"Mexico"},
    "67"=>{:code=>"nl", :name=>"Netherlands"},
    "392"=>{:code=>"pl", :name=>"Poland"},
    "268"=>{:code=>"pt", :name=>"Portugal"},
    "400"=>{:code=>"ro", :name=>"Romania"},
    "402"=>{:code=>"ru", :name=>"Russia"},
    "408"=>{:code=>"sg", :name=>"Singapore"},
    "412"=>{:code=>"sk", :name=>"Slovakia"},
    "447"=>{:code=>"za", :name=>"South Africa"},
    "348"=>{:code=>"kr", :name=>"South Korea"},
    "270"=>{:code=>"es", :name=>"Spain"},
    "73"=>{:code=>"se", :name=>"Sweden"},
    "34"=>{:code=>"ch", :name=>"Switzerland"},
    "425"=>{:code=>"th", :name=>"Thailand"},
    "432"=>{:code=>"tr", :name=>"Turkey"},
    "46"=>{:code=>"gb", :name=>"United Kingdom"},
    "78"=>{:code=>"us", :name=>"United States"}
  }

  # Initializes the NetflixContentRepo service
  def initialize
    @repo = NetflixContentRepo.new
  end

  # Changes the API_COUNTRIES constant to match the simple form required
  # format - called on forms with FetchTitlesService.new.user_countries
  def user_countries
    # Iterates through each API_COUNTRIES value hash
    # e.g {:code=>"us", :name=>"United States"}
    # and for each value hash it adds a new [country[:code], country[:name]]
    # array element to the initial []. Returns an array of arrays
    API_COUNTRIES.values.inject([]) do |acc, country|
      acc << [country[:code], country[:name]]
    end
  end

  # Gets the result of UNOGS API for netflix expiring titles
  # with default country_code being 'pt'
  def get_expiring_content(country_code = 'pt')
    # Calls the all_expiring method from the NetflixContentRepo service
    # which is where the API is called to get all expiring titles
    expiring = @repo.all_expiring(country_code)

    # Iterates each of items on the body of the expiring titles call result
    expiring.body["ITEMS"].each do |item|
      imdb_id = item["imdbid"].strip
      netflix_id = item["netflixid"].strip

      # Looks into the Content table to se the item is already on the database
      item_content = Content.find_by(netflix_id: netflix_id,
                                     country_code: country_code)
      # Skips the logic below if the item is already on the database
      next item_content if item_content.present?
      # Defines hash with key-value pairs of the info needed to save on Content
      expiring_on_netflix = {
        country_code: country_code,
        netflix_id: netflix_id,
        title: item["title"],
        image_url: item["image"],
        category: item["type"],
        netflix_rating: item["rating"],
        imdb_id: imdb_id,
        expiration_date: item["unogsdate"],
        runtime: item["runtime"]
      }

      # If the item's imdb_id is different than 'notfound'
      if imdb_id != "notfound"
        # Calls the load_title from the NetflixContentRepo service and fetches
        # the movie for the corresponding item
        movie = @repo.load_title(imdb_id)
        # Defines a hash with key-value pairs for the imdb info needed to save
        # on the Content table
        imdb_details = {
          genre: movie.body["RESULT"]["imdbinfo"]["genre"],
          imdb_rating: movie.body["RESULT"]["imdbinfo"]["rating"].to_f,
          plot: movie.body["RESULT"]["imdbinfo"]["plot"],
          details: {
            awards: movie.body["RESULT"]["imdbinfo"]["awards"],
            metascore: movie.body["RESULT"]["imdbinfo"]["metascore"],
            origin: movie.body["RESULT"]["imdbinfo"]["country"],
            language: movie.body["RESULT"]["imdbinfo"]["language"]
          },
          cast: movie.body["RESULT"]["people"]
        }
        # Merges the imdb_details hash into the expiring_on_netflix hash
        expiring_on_netflix.merge!(imdb_details)
      end
      # Queries the Content table for the item's netflix_id and country_code
      # pair with the expiring_on_netflix attributes
      # Then, first_or_create checks whether first returns nil or not
      # If it does return nil, then a new Content instance is created with the
      # expiring_on_netflix attributes, otherwise we go to the next item
      Content.where(netflix_id: netflix_id, country_code: country_code)
             .first_or_create!(expiring_on_netflix)
    end
  end

  # Updates the calls' results on NetflixApiCall table (query & body)
  def refresh_api_cache
    country_codes = API_COUNTRIES.map { |_, country| country[:code] }
    codes_lock = Mutex.new

    # (0..3).collect do is equivalent to 4.times do
    # To accelerate the API call we use 4 threads simultaneously to make requests
    country_threads = (0..3).collect do
      Thread.new do
        country_code = nil

        # Locks a country code from the API_COUNTRIES constant at a time
        loop do
          codes_lock.synchronize {
            country_code = country_codes.pop
          }

          break if country_code.nil?

          # Calls the all_expiring method to make a new API expiring titles call
          # for that country code
          expiring = @repo.all_expiring(country_code, refresh: true)
          # Calls the load_title method to make a new API imdb details call for
          # that country code if the imdb_id is different than 'notfound'
          expiring.body["ITEMS"].reject { |i| i["imdbid"] == "notfound" }.each do |item|
            @repo.load_title(item["imdbid"].strip, refresh: true)
          end
        end
      end
    end

    # Threads that finished are joined to the ones running so that the process
    # doesn't exit while others are still pending
    country_threads.each(&:join)
  end
end
