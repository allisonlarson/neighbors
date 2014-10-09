Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_key, Rails.application.secrets.twitter_secret,
    {
      :secure_image_url => 'true',
      :image_size => 'original'
    }
end
