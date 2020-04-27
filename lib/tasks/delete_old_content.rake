namespace :outflix do
  desc "Deletes titles that are not on Netflix anymore"
  task delete_old_content: :environment do
    if Time.now.to_date.tuesday?
      puts "Selecting old movies and shows from the Content database..."

      # will_delete = Content.where('expiration_date < ?', Date.today).count
      will_delete = Content.where('expiration_date < ?', Date.today.beginning_of_week).count

      puts "Found #{will_delete} movies and shows for deletion"

      # deleted = Content.where('expiration_date < ?', Date.today).delete_all
      deleted = Content.where('expiration_date < ?', Date.today.beginning_of_week).delete_all

      puts "Great success! Deleted #{deleted} expired movies and shows."
    else
      puts "This task should only be executed on Mondays. Over and out!"
    end
  end
end
