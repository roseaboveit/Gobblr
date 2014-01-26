Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer # if Rails.env.development?
  provider :twitter, ENV["TWITTER_CONSUMER_KEY"], ENV["TWITTER_CONSUMER_SECRET"]
end