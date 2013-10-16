module Email
  extend self
  include Rails.application.routes.url_helpers  

  API_KEY = ENV["MAILGUN_KEY"]
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/ramblerides.mailgun.org/messages"

  def send_summary_email
    dashboard_length = Dashboard.count
    
    # current should have only API data
    current = Dashboard.find(dashboard_length)
    
    begin
    # last should have both API data and form data
      last = Dashboard.find(dashboard_length-1)
    rescue
      last = Dashboard.new
    end
    
    dashboard = {}
    text = ""

    # metrics that are collected in aggregate
    # the difference needs to be taken to get a daily figure
    summary_form        = [:blog_posts,
                          :checkins,
                          :photos,
                          :tasks]
    
    # metrics that only reflect the day they are captured
    daily_form          = [:active_score,
                          :weight,
                          :meditated,
                          :had_sex,
                          :stretched,
                          :mood,
                          :slept,
                          :climbed,
                          :email_conversations,
                          :calendar_events]
                          
    all = summary_form|daily_form
                          
    summary_form.each do |key|
      _current = current.send(key)
      _last = last.send(key)
      
      if _current == nil
        _current = 0
      end
      
      if _last == nil
        _last = 0
      end  
        
      begin
        dashboard[key] = _current - _last
      rescue
        dashboard[key] = "error"
      end
    end
      
    daily_form.each do |key|
      val = last.send(key)
      if val == nil
        val = "not captured."
      end
      dashboard[key] = val
    end
    
    all.each do |key|
      text << "#{key.to_s}: #{dashboard[key]}"
      text << "\n"
    end
    
    text << "http://cryptic-thicket-6982.herokuapp.com/dashboards/#{Dashboard.last.id}/edit"

    data = {}
    data[:from] = "Yourself <thomas.vladeck@gmail.com>"
    data[:to] = "Tom <thomas.vladeck@gmail.com>"
    data[:subject] = "Morning Sumary"
    data[:text] = text
    
    RestClient.post(API_URL, data)
  end
    

end