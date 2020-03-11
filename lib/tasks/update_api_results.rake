namespace :outflix do
  desc "Fetch and save updated API call query and result"
  task update_api_results: :environment do
    puts "Calling UNOGS API to update NetflixApiCall table..."
    @service = FetchTitlesService.new
    @service.refresh_api_cache
    puts "All done! NetflixApiCall updated."
  end

end
