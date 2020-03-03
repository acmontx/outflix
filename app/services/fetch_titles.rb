require 'uri'
require 'net/http'
require 'openssl'

class FetchTitles
  def httpGet(uri)
    url = URI(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['X-RAPIDAPI-KEY']

    response = http.request(request)

    body = response.read_body
    result = JSON.parse(body)
  end

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
    if countryCode == nil
      countryCode = 'PT' # if country is nil assume 'PT' but should be a different msg?
    end

    result = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=get%3Aexp%3A#{countryCode}&t=ns&st=adv&p=1")

    content = result["ITEMS"].map { |item|
      {
        netflixid: item["netflixid"],
        title: item["title"],
        image_url: item["image"],
        plot: item["synopsis"].split('<br>')[0],
        category: item["type"],
        expiration_date: item["unogsdate"],
      }
    }
    return content
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
end
