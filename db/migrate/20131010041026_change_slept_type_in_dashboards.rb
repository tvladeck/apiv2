class ChangeSleptTypeInDashboards < ActiveRecord::Migration
  def self.up
   change_column :dashboards, :slept, :integer
  end

  def self.down
    change_column :dashboards, :slept, :boolean
  end
end
