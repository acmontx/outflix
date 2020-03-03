require 'uri'
require 'net/http'
require 'openssl'

class FetchTitles
  def self.getCountries
    url = URI("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?t=lc&q=available")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'b719473d32msh887dc3ee40f527ap1a89ebjsn7af94eb012d8'
    response = http.request(request)
    body = response.read_body
    result = JSON.parse(body)
    # result["ITEMS"][0][0] = 268 - country id
    # result["ITEMS"][0][1] = pt - country code
    # result["ITEMS"][0][2] = Portugal - country name
    countries  = result["ITEMS"].map { |item| { item[1] => item[0] } }
    p countries

    return countries
  end

  def self.getExpiringContent(countryCode)
    getCountries["PT"]
    #url = URI("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=#{query}-!1900%2C21-!0%2C5-!0%2C10-!0-!Any-!Any-!Any-!gt0-!%7Bdownloadable%7D&t=ns&cl=#{countryId}&st=adv&ob=Relevance&p=1&sa=and")

    url = URI("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=get%3Aexp%3A#{countryCode}&t=ns&st=adv&p=1")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'b719473d32msh887dc3ee40f527ap1a89ebjsn7af94eb012d8'
    response = http.request(request)
    body = response.read_body
    result = JSON.parse(body)
    content = result["ITEMS"].map { |item|
      {
        netflixid: item["netflixid"],
        title: item["title"],
        image_url: item["image"],
        plot: item["synopsis"],
        category: item["type"],
        expiration_date: item["unogsdate"],
      }
    }
    return content
  end
end
