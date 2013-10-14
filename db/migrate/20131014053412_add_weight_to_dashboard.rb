class AddWeightToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :weight, :integer
  end
end
