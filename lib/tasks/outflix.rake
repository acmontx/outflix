namespace :outflix do
  desc "Deletes titles that are not on Netflix anymore"
  task delete_old_content: :environment do
    if Time.now.to_date.monday?
      puts "Selecting old movies and shows from the Content database..."

      Content.where('expiration_date < ?', Date.today).delete_all

      puts "Great success! All movies and shows prior to today were deleted."
    else
      puts "This task should only be executed on Mondays. Over and out!"
    end
  end
end
