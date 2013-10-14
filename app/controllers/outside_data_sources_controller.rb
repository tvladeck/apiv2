class OutsideDataSourcesController < ApplicationController
  
  def summarize
  
  # pull latest dashboard instance
  # summarize it
  # send email w/ summary and link to dashboard#new
    Email.send_summary_email
    render nothing: true, status: 200    
  end
  
  
  def create
    @dashboard = Dashboard.last
    @dashboard.update_attributes outside_params
    redirect_to dashboards_path
  end
  
private

  def outside_params
    params.permit(:email_conversations, :calendar_events)
  end
  
end
