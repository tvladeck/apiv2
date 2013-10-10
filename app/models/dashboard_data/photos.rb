module DashboardData
  module Photos
    extend self
    
    def photos_uploaded
      response = RestClient.get FLICKR_URL
      xml = Nokogiri::XML response
      count = xml.xpath('rsp/person/photos/count').children.text.to_i
      count
    end
  
  end
end