module DashboardData
  extend self

  def data
    data = {}
    data[:blog_posts]   = self::Blogging.total_posts
    data[:checkins]     = self::Checkins.count
    data[:active_score] = self::Fitbit.active_score
    data[:photos]       = self::Photos.photos_uploaded
    data[:tasks]        = self::Tasks.tasks_completed
    data
  end 

end