Twitter.configure do |config|
  config.consumer_key        = ENV["TWTR_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWTR_CONSUMER_SECRET"]
  config.oauth_token = ENV['TWTR_ACCESS_TOKEN']
  config.oauth_token_secret = ENV['TWTR_ACCESS_TOKEN_SECRET']
end

TWITTER_ID = 19737743