require 'uri'
require 'net/http'
require 'openssl'

class NetflixContentRepo
  # Constant for the base API endpoint, common to all UNOGS API queries
  API_URL = "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi"

  # 2. Calls the expiring titles endpoint and passes the country code as a
  # parameter; calls the ensure_call method passing the query previously built
  def all_expiring(country_code, refresh: false)
    query = build_all_expiring_query(country_code)
    ensure_call(query, refresh)
  end

  # 2. Calls the title imdb details endpoint and passes the country code as a
  # parameter; calls the ensure_call method passing the query previously built
  def load_title(imdb_id, refresh: false)
    query = build_load_title_query(imdb_id)
    ensure_call(query, refresh)
  end

  private

  # 3. Checks if the API call result exists on the NetflixApiCall table
  def ensure_call(query, refresh = false, retried = false)
    # Fetches an instance of NetflixApiCall from the database with a given query
    cached = NetflixApiCall.find_by(query: query)

    # If the instance is present on the database
    if cached.present?
      # Calls the refresh method (which calls the API) if the refresh parameter
      # is true or if the cached instance is old or its body is nil
      # stale method is defined on the NetflixApiCall model
      return refresh(cached) if refresh || cached.stale?
      cached
    else
      # 4. If the instance does not exist on the database we create a new
      # instance and call the refresh method on it to call the API
      refresh(NetflixApiCall.new(query: query))
    end
  # If an ActiveRecord::RecordInvalid exception occurs the flow is rescued to
  # call the ensure_call method once more with the retried parameter as true
  # If we get the same exception once again the program terminates
  rescue ActiveRecord::RecordInvalid
    raise if retried
    ensure_call(query, refresh, true)
  end

  # 5. The refresh method calls the fetch method which performs the API call
  # The parameter is an instance of NetflixApiCall and the instance's body
  # is the result of the fetch method for the corresponding query
  def refresh(call)
    call.body = fetch(call.query)
    call.save!
    call
  end

  # 1. Returns the UNOGS API query for expiring titles
  def build_all_expiring_query(country_code)
    "q=get%3Aexp%3A#{country_code}&t=ns&st=adv&p=1"
  end

  # 1. Returns the UNOGS API query for title imdb details
  def build_load_title_query(imdb_id)
    "t=loadvideo&q=#{imdb_id}"
  end

  # 6. Calls the UNOGS API
  def fetch(query)
    # Returns the string if the API key is missing
    raise "Missing API key" if ENV['X_RAPIDAPI_KEY'].empty?

    # Builds the URL
    url = URI(API_URL + "?#{query}")

    # Given by UNOGS
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']

    # If the API result includes an empty string we get an error and the call
    # execution stops, so we need to retry the call; below we set the code to
    # retry 3 times if we get the JSON::ParserError exception
    attempt_count = 0
    max_attempts = 3

    begin
      response = http.request(request)
      attempt_count += 1
      puts "attempt ##{attempt_count}"
      JSON.parse response.read_body
    rescue JSON::ParserError => e
      puts "error: #{e}"
      sleep 3
      retry if attempt_count < max_attempts
      # If at the 3rd time we still get the exception execution stops
      raise
    end
  end
end
