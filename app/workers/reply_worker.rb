class TextWorker
  include Sidekiq::Worker

  def self.reply(user, neighborhood_name)
    client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
    client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: user.phone_number,
      body: "Your photo from #{neighborhood_name} has been uploaded! Check it out!"
    )
  end
end
