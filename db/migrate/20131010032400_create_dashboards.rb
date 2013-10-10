class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.integer :blog_posts
      t.integer :checkins
      t.integer :active_score
      t.integer :photos
      t.integer :tasks
      t.boolean :meditated
      t.boolean :had_sex
      t.boolean :stretched
      t.string :mood
      t.boolean :slept
      t.boolean :climbed

      t.timestamps
    end
  end
end
