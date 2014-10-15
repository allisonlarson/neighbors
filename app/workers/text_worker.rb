class TextWorker
  include Sidekiq::Worker

  def self.text(user)
    client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
    client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: user.phone_number,
      body: "Hi from Neighbors! Text this number with a photo and which neighborhood you're in, and we'll upload it for you."
    )
  end
end
