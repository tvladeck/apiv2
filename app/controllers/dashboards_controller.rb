class DashboardsController < ApplicationController
  
  def new
    @dashboard = Dashboard.new
  end
  
  def create
    # this method pulls from both the user-submitted form and 
    # data from APIs
    # the data from APIs comes from DashboardData.data
    # the data from the form will come from the params
    api_data = DashboardData.data
    @dashboard = Dashboard.create
  end
  
private

  def dashboard_params
  end

end
