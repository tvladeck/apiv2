class OutsideDataSourcesController < ApplicationController
  
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
