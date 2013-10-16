class DashboardsController < ApplicationController
  
  def new
    @dashboard = Dashboard.new
  end
  
  def create
    # this method only pulls from the user-submitted form
    @dashboard = Dashboard.create dashboard_params
    redirect_to dashboards_path
  end
  
  def edit
    @dashboard = Dashboard.find(params[:id])
  end
  
  def update
    # this method only pulls from the user-submitted form
    @dashboard = Dashboard.find(params[:id])
    @dashboard.update_attributes dashboard_params
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
