module DashboardData
  module Fitbit
    extend self
    
    oauth = {}
    oauth[:consumer_key] = ENV["FITBIT_CONSUMER_KEY"]
    oauth[:consumer_secret] = ENV["FITBIT_CONSUMER_SECRET"]
    oauth[:token] = ENV["FITBIT_TOKEN"]
    oauth[:secret] = ENV["FITBIT_SECRET"]

    @fitbit = Fitgem::Client.new oauth
    
    def active_score
      @fitbit.activities_on_date(Date.today)["summary"]["activeScore"]
    end
    
  end
end