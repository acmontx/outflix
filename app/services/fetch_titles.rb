require 'uri'
require 'net/http'
require 'openssl'
require 'byebug'

class FetchTitles

  def httpGet(uri)
    url = URI(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '3c6c469afdmsh1ce21b1771fa10cp1c2290jsn0225ed06aa90'


    response = http.request(request)

    body = response.read_body
    result = JSON.parse(body)
  end


  def getCountries
    result = httpGet("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?t=lc&q=available")
    countries = result["ITEMS"].map { |item| { code: item[1], name: item[2] } }
    return countries
  end


  def getExpiringContent(countryCode)

    if countryCode == nil
      countryCode = 'PT'
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
end

















