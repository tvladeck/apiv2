class OutsideDataSourcesController < ApplicationController
  
  def summarize
  
  # pull latest dashboard instance
  # summarize it
  # send email w/ summary and link to dashboard#new
    Email.send_summary_email
    render nothing: true, status: 200    
  end
  
  
  def create
    
    # pulls from all outside data sources, params and api-data
    
    if Dashboard.last.update_at.day == Date.today.day
      @dashboard = Dashboard.last
    else
      @dashboard = Dashboard.new
    end
    
    api_data = DashboardData.data
    @dashboard.update_attributes api_data
    
    @dashboard.update_attributes outside_params
    redirect_to dashboards_path
  end
  
private

  def outside_params
    params.permit(:email_conversations, :calendar_events)
  end
  
end
