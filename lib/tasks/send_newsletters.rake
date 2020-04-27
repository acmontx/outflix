namespace :outflix do
  desc "Send newsletters to users according to their frequenc preference"
  task send_newsletters: :environment do
    # for each user in the database
    # if its notification preference is weekly
    # call newsletter mailer every monday
    # if its notification preference is monthly
    # call newsletter every 4 weeks

    # if Date.today.monday?
    if Date.today.tuesday?
      weekly_users = User.where(frequency: "Weekly")
      weekly_users.each do |user|
        if user[:medium] == 'Email'
          UserMailer.with(user: user).newsletter.deliver_now
        else
          user.send_text_message
        end
      end
    else
      puts "This task should only be executed on Mondays. Over and out!"
    end

    if Date.today == Date.today.beginning_of_month
      monthly_users = User.where(frequency: "Monthly")
      monthly_users.each do |user|
        if user[:medium] == 'Email'
          UserMailer.with(user: user).newsletter.deliver_now
        else
          user.send_text_message
        end
      end
    else
      puts "This task should only be executed on the 1st day of every month. Over and out!"
    end
  end
end
