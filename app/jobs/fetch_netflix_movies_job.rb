class FetchNetflixMoviesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "starting"
    sleep 3
    puts "Fetching movies..."
    @service = FetchTitlesService.new
    #current_user.country
    @service.get_expiring_content("pt")
    puts "done"
  end
end
