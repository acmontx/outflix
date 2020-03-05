require 'uri'
require 'net/http'
require 'openssl'

class NetflixContentRepo
  API_URL = "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi"

  def all_expiring(country_code)
    query = build_query(country_code)
    cached = NetflixApiCall.find_by(query: query)

    if cached.present?
      return refresh(cached) if cached.stale?
      cached
    else
      refresh(NetflixApiCall.create!(query: query))
    end
  end

  private

  def refresh(call)
    puts "refreshing"
    call.body = fetch(call.query)
    call.save!
    call
  end

  def build_query(country_code)
    "q=get%3Aexp%3A#{country_code}&t=ns&st=adv&p=1"
  end

  def fetch(query)
    url = URI(API_URL + "?#{query}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    # request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
    request["x-rapidapi-key"] = 'b719473d32msh887dc3ee40f527ap1a89ebjsn7af94eb012d8'

    response = http.request(request)

    JSON.parse response.read_body
  end
end
