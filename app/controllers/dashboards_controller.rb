class DashboardsController < ApplicationController
  
  def new
    @dashboard = Dashboard.new
  end
  
  def create
    # this method only pulls from both the user-submitted form
    
    
    # data from APIs
    # the data from APIs comes from DashboardData.data
    # the data from the form will come from the params

    @dashboard = Dashboard.create dashboard_params

    redirect_to dashboards_path
  end
  
  def show
    @dashboard = Dashboard.find(params[:id])
  end
  
  def index
    @data = Dashboard.all
  end
  
private

  def dashboard_params
    params.require(:dashboard).permit(:meditated,
                                      :weight,
                                      :stretched,
                                      :climbed,
                                      :mood,
                                      :slept,
                                      :had_sex)
  end

end
