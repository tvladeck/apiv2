module DashboardData
  module Tweets
    extend self
    
    # this is the function we'll export, bitches
    def count
      Twitter.user(TWITTER_ID).status_count
    end
    
    def today
      list_of_tweets = Twitter.user_timeline(TWITTER_ID)
      todays_tweets = list_of_tweets.select { |t| t[:created_at].today? == true }
      count = todays_tweets.count
    end
  end
end