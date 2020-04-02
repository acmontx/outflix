Outflix is an expiring content tracker that notifies its users weekly or mothly about the Movies and TV shows leaving Netflix in the coming weeks.

This app was built for Le Wagon's demo day of batch #346 in Lisbon.

TODOs:
- Call the UNOGS API more often (e.g twice a week) as UNOGS results are not cumulative;
- Allow users to receive both the SMSs and the emails;
- Add filters to the notifications so that it's more tailored to user (e.g 'only notify me of a drama genre titles leaving Netflix' or 'Don't notify me of animation genre titles' or 'Only notify me of TV shows leaving Netflix';
- Finish My List onboarding to get all the titles on users 'My List' or redo notifications to allow users to write down the titles that they want to be notified about once they have an expiration date assigned;
- Improve rake tasks to make sure they don't fail in production;
- Make sure users receive their emails, maybe by making sure that notification_size increases weekly;
- Upgrade Twilio service;


Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
