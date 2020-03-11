require 'twilio-ruby'

class TwilioService

  def initialize
    account_sid = 'ACcae579b4d4bd6d305aa201bb169e266a'
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

#How to call twilio to send messages
   # @twilio = TwilioService.new
   #  @twilio.sendText('message', '+1234567890') *recipient number must be verified.

  def sendText(text, recepient)
    message = @client.messages
      .create(
         body: text,
         from: ENV['SENDER'],
         to: recepient
      )

    puts message.sid

  end

end

