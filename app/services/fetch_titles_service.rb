require 'uri'
require 'net/http'
require 'openssl'

class FetchTitlesService
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

  def get_expiring_content(country_code = 'pt')
    repo = NetflixContentRepo.new

    expiring = repo.all_expiring(country_code)
    # ALL THE MOVIES FROM ALL THE COUNTRIES
    # url = "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=#{country_code}&t=ns&st=adv&p=1"
    # ONLY FOR GIVEN COUNTRY
    # result = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=get%3Aexp%3A#{country_code}&t=ns&st=adv&p=1")

    expiring.body["ITEMS"].each do |item|
      imdb_id = item["imdbid"].strip
      netflix_id = item["netflixid"].strip

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

      # imdb_response = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?t=loadvideo&q=#{imdb_id}")

      if imdb_id != "notfound"
        movie = repo.load_title(imdb_id)

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

        expiring_on_netflix.merge!(imdb_details)
      end

      Content.where(netflix_id: netflix_id, country_code: country_code)
             .first_or_create(expiring_on_netflix)
    end
  end

  def refresh_expiring_content
    repo = NetflixContentRepo.new
    country_codes = API_COUNTRIES.map { |_, country| country[:code] }
    codes_lock = Mutex.new

    country_threads = 4.times do
      Thread.new do
        country_code = nil

        loop do
          codes_lock.synchronize {
            country_code = country_codes.pop
          }

          break if country_code.nil?

          expiring = repo.all_expiring(country_code)
          expiring.body["ITEMS"].reject { |i| i["imdbid"] == "notfound" }.each do |item|
            repo.load_title(item["imdbid"].strip)
          end
        end
      end
    end

    country_threads.each(&:join)
  end

  private

  def httpGet(uri)
    url = URI(uri)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']

    response = http.request(request)

    body = response.read_body
    result = JSON.parse(body)
  end

end
