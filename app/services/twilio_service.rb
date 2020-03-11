require 'twilio-ruby'

class TwilioService
  def initialize
    account_sid = 'ACcae579b4d4bd6d305aa201bb169e266a'
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(text, recepient)
    options = {
      body: text,
      from: ENV['SENDER'],
      to: recepient
    }

    @client.messages.create(options)
  end
end

