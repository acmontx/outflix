namespace :outflix do
  desc "Send newsletters to users according to their frequenc preference"
  task send_newsletters: :environment do
    # for each user in the database
    # if its notification preference is weekly
    # call newsletter mailer every monday
    # if its notification preference is monthly
    # call newsletter every 4 weeks

    if Time.now.to_date.monday?
      User.where
    end

  end
end
