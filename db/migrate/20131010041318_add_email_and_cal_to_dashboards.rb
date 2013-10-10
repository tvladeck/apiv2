class AddEmailAndCalToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :email_conversations, :integer
    add_column :dashboards, :calendar_events, :integer
  end
end
