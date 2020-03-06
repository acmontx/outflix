# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: ENV['outflix.rocks@gmail.com'],
  password: ENV['fdklwpksayohogxa'],
  authentication: :login,
  enable_starttls_auto: true
}
