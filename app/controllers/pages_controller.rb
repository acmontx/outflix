require 'uri'
require 'net/http'
require 'openssl'
require 'byebug'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  @countries = getCountries

  @content = getExpiringContent("US")

  end

end


  def getCountries
    url = URI("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?t=lc&q=available")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '03849ae78dmshc5dfeac667ef8b5p1c7342jsne28a8fef094e'

    response = http.request(request)

    body = response.read_body
    result = JSON.parse(body)

    # result["ITEMS"][0][1] = ar - country code
    # result["ITEMS"][0][2] = Argentina - country name
    countries = result["ITEMS"].map { |item| { code: item[1], name: item[2] } }
    return countries
  end

  def getExpiringContent(countryCode)
    url = URI("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=get%3Aexp%3A#{countryCode}{}&t=ns&st=adv&p=1")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = '03849ae78dmshc5dfeac667ef8b5p1c7342jsne28a8fef094e'

    response = http.request(request)
    body = response.read_body
    result = JSON.parse(body)

    content = result["ITEMS"].map { |item|
      {
        netflixid: item["netflixid"],
        title: item["title"],
        image:item["image"],
        synopsis: item["synopsis"],
        expiry: item["unogsdate"].gsub("2017", "2020"),
      }
    }
    return content



  end
