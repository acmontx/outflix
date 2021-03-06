namespace :outflix do
  desc "Fetch the updated API results and load them to contents"
  task update_content_results: :environment do
    if Time.now.to_date.monday?
      puts "Checking new API results..."
      # Grabbing all possible country codes
      country_codes = FetchTitlesService::API_COUNTRIES.values.map { |c| c[:code] }
      @service = FetchTitlesService.new

      country_codes.each do |country_code|
        # Calls the get_expiring_content method on the service for each country
        @service.get_expiring_content(country_code)
      end

      puts "Done! Content table updated."
    else
      puts "This task should only be executed on Mondays. Over and out!"
    end
  end
end
