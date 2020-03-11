require 'uri'
require 'net/http'
require 'openssl'

class NetflixContentRepo
  # Base API endpoint, common to all UNOGS API queries
  API_URL = "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi"

  # 2. Calls the expiring titles endpoint and passes the country code as a
  # parameter; calls the ensure_call method passing the query previously built
  def all_expiring(country_code, refresh: false)
    query = build_all_expiring_query(country_code)
    ensure_call(query, refresh)
  end

  def load_title(imdb_id, refresh: false)
    query = build_load_title_query(imdb_id)
    ensure_call(query, refresh)
  end

  private

  # 3. Checks if the API result exists on the
  def ensure_call(query, refresh = false, retried = false)
    # call that was already on db
    cached = NetflixApiCall.find_by(query: query)

    if cached.present?
      # if refresh true
      return refresh(cached) if refresh || cached.stale?
      cached
    else
      # 4. creates new call - changed create! to new
      refresh(NetflixApiCall.new(query: query))
    end
  rescue ActiveRecord::RecordInvalid
    raise if retried
    ensure_call(query, refresh, true)
  end

  # 4.
  def refresh(call)
    call.body = fetch(call.query)
    call.save!
    call
  end

  # 1. Returns the UNOGS API query for expiring titles
  def build_all_expiring_query(country_code)
    "q=get%3Aexp%3A#{country_code}&t=ns&st=adv&p=1"
    # ALL THE MOVIES FROM ALL THE COUNTRIES
    # url = "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=#{country_code}&t=ns&st=adv&p=1"
  end

  def build_load_title_query(imdb_id)
    "t=loadvideo&q=#{imdb_id}"
  end

  def fetch(query)
    raise "Missing API key" if ENV['X_RAPIDAPI_KEY'].empty?

    url = URI(API_URL + "?#{query}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']

    response = http.request(request)

    JSON.parse response.read_body
  end
end
