Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer # if Rails.env.development?
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'],
  {
      :secure_image_url => 'true',
      :x_auth_access_type => 'read&write'
    }
  if Rails.env.development?
    provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET_KEY']
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  else
    provider :facebook, ENV['FACEBOOK_HEROKU_ID'], ENV['FACEBOOK_HEROKU_SECRET_KEY']
    provider :github, ENV['GITHUB_HEROKU_KEY'], ENV['GITHUB_HEROKU_SECRET_KEY']
  end
end


# CLIENT ID ac9386ec62734601820643da4df1225f
# CLIENT SECRET 76e001447e1c46a6970de4445aa7e635