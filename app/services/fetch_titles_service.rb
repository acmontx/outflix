require 'uri'
require 'net/http'
require 'openssl'

class FetchTitlesService
  # Check if titles are already in th DB or fetch the titles




# This is the code to use with the API. It's commented out because I'm using
# the other file to use with json and not use the API
# If you uncomment this code and change the method names on the controller,
# you can use the API, but please change the x-rapidapi-key.

  def getCountries
    result = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?t=lc&q=available")
    # result["ITEMS"][0][0] = 268 - country id
    # result["ITEMS"][0][1] = pt - country code
    # result["ITEMS"][0][2] = Portugal - country name
    # countries = result["ITEMS"].map { |item| { code: item[1], name: item[2] } }
    countries  = result["ITEMS"].map { |item| { item[1] => item[0] } }
    countries
  end

  def getExpiringContent(countryCode)
    if countryCode.empty?
      countryCode = 'PT' # if country is nil assume 'PT' but should be a different msg?
    end

    # ALL THE MOVIES FROM ALL THE COUNTRIES
    url = "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=#{countryCode}&t=ns&st=adv&p=1"

    result = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=get%3Aexp%3A#{countryCode}&t=ns&st=adv&p=1")
    # { "COUNT":"14","ITEMS":[ {"netflixid":"80087352","title":"Same Kind of Different as Me","image":"https://occ-2S-HnHH ....

    result["ITEMS"].each do |item|
      imdb_id = item["imdbid"].strip
      netflix_id = item["netflixid"].strip

       expiring_on_netflix = {
        netflix_id: netflix_id,
        title: item["title"],
        image_url: item["image"],
        category: item["type"],
        netflix_rating: item["rating"],
        imdb_id: imdb_id,
        expiration_date: item["unogsdate"],
        runtime: item["runtime"]
      }
      imdb_response = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?t=loadvideo&q=#{imdb_id}")
      # {
      # "RESULT": {
      #     "nfinfo": {
      #         "image1": "https://occ-0-2794-2218.1.nflxso.net/dnm/api/v6/evlCitJPPCVCry0BZlEFb5-QjKc/AAAABWxskqiZlsP9QL-sz2oW2l2hyngU6PQYwkJMpDfRqQeDYZelZvxqcE5lMQX4qr6FqSXfcE6c2wltSNnrkJRcj3sSXJ66.jpg?r=863",
      #         ...
      #      },
      #     "imdbinfo": {
      #.       "genre": ...
      #     },
      #.    "people": { ... }
      imdb_details = {
        genre: imdb_response["RESULT"]["imdbinfo"]["genre"],
        imdb_rating: imdb_response["RESULT"]["imdbinfo"]["rating"].to_f,
        plot: imdb_response["RESULT"]["imdbinfo"]["plot"],
        details: {
          awards: imdb_response["RESULT"]["imdbinfo"]["awards"],
          metascore: imdb_response["RESULT"]["imdbinfo"]["metascore"],
          origin: imdb_response["RESULT"]["imdbinfo"]["country"],
          language: imdb_response["RESULT"]["imdbinfo"]["language"]
        },
        cast: imdb_response["RESULT"]["people"]
      }

      attributes = expiring_on_netflix.merge(imdb_details)
      Content.where(netflix_id: netflix_id).first_or_create(attributes)
    end

  end

  def getTitlesPerCountry(countryId)
    result = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=''-!1900%2C2100-!0%2C5-!0%2C10-!0-!Any-!Any-!Any-!gt0-!%7Bdownloadable%7D&t=ns&cl=#{countryId}&st=adv&ob=Relevance&p=1&sa=or")
    p result
    content = result["ITEMS"].map { |item|
      {
        netflixid: item["netflixid"],
        title: item["title"],
        image_url: item["image"],
        plot: item["synopsis"].split('<br>')[0],
        category: item["type"]
      }
    }
    return content
  end

  private

  def httpGet(uri)
    url = URI(uri)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'b719473d32msh887dc3ee40f527ap1a89ebjsn7af94eb012d8'

    # NOT WORKING ON .env
    # request["x-rapidapi-key"] = ENV['X-RAPIDAPI-KEY']
    response = http.request(request)

    body = response.read_body
    result = JSON.parse(body)
  end

end
