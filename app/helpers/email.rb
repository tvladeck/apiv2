module Email
  extend self
  include Rails.application.routes.url_helpers  

  API_KEY = ENV["MAILGUN_KEY"]
  API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/ramblerides.mailgun.org/messages"

  def send_summary_email
    dashboard_length = Dashboard.count
    current = Dashboard.find(dashboard_length)
    
    begin
      last = Dashboard.find(dashboard_length-1)
    rescue
      last = Dashboard.new
    end
    
    dashboard = {}
    text = ""

    
    last_dependent     = [:blog_posts,
                          :checkins,
                          :photos,
                          :tasks]
    
    not_last_dependent = [:active_score,
                          :weight,
                          :meditated,
                          :had_sex,
                          :stretched,
                          :mood,
                          :slept,
                          :climbed,
                          :email_conversations,
                          :calendar_events]
                          
      all = last_dependent|not_last_dependent
                          
      last_dependent.each do |key|
        _current = current.send(key) != nil ? current.send(key) : 0
        _last = last.send(key) != nil ? current.send(key) : 0
        dashboard[key] = _current - _last
      end
      
      not_last_dependent.each do |key|
        val = current.send(key)
        dashboard[key] = val != nil ? val : "nope!"
      end
      
      all.each do |key|
        text << "#{key.to_s}: #{dashboard[key]}"
        text << "\n"
      end
      
      text << "http://cryptic-thicket-6982.herokuapp.com/dashboards/edit/#{Dashboard.last.id}"
        
      
      
      data = {}
      data[:from] = "Yourself <thomas.vladeck@gmail.com>"
      data[:to] = "Tom <thomas.vladeck@gmail.com>"
      data[:subject] = "Morning Sumary"
      data[:text] = text
      
      RestClient.post(API_URL, data)
    end
    

end