module DashboardData
  module Checkins
    
    @fsq = Foursquare2::Client.new(client_id: ENV["FOURSQUARE_CLIENT_ID"], 
                                   client_secret: ENV["FOURSQUARE_CLIENT_SECRET"])

    FOURSQUARE_ID = 13913963
    
    extend self
    def count
      data = @fsq.user(FOURSQUARE_ID)
      data["checkins"]["count"]
    end
  end
end