namespace :outflix do
  desc "Fetch and save updated API call query and result"
  task update_api_results: :environment do
    if Time.now.to_date.monday?
      Rails.application.eager_load!
      puts "Calling UNOGS API to update NetflixApiCall table..."
      @service = FetchTitlesService.new
      @service.refresh_api_cache
      puts "All done! NetflixApiCall table updated."
    else
      puts "This task should only be executed on Mondays. Over and out!"
    end
  end
end
