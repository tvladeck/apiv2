module DashboardData
  module Tasks
    extend self
    
    def tasks_completed
      JSON.parse(RestClient.get TRELLO_API_URL).length
    end
  
  end
end