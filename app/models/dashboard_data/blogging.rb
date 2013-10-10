module DashboardData
  module Blogging
    extend self  
    # @feed = Feedzirra::Feed.fetch_and_parse("http://www.tomvladeck.com/feed")    
    @json = JSON.parse(RestClient.get("www.tomvladeck.com/?json=1"))

    def total_posts
      @json["count_total"]
    end
  end
end